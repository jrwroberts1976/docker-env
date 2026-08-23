#!/usr/bin/env python3

from http.server import BaseHTTPRequestHandler, HTTPServer
import re
import subprocess


ROUTER_HOST = "192.168.2.1"
ROUTER_USER = "james"
SSH_KEY = "/root/.ssh/asus_router"
PORT = 9106


def run_ssh(command: str) -> str:
    result = subprocess.run(
        [
            "ssh",
            "-i",
            SSH_KEY,
            "-o",
            "BatchMode=yes",
            "-o",
            "IdentitiesOnly=yes",
            "-o",
            "ConnectTimeout=5",
            "-o",
            "StrictHostKeyChecking=no",
            "-o",
            "UserKnownHostsFile=/dev/null",
            "-o",
            "LogLevel=ERROR",
            "-o",
            "WarnWeakCrypto=no",
            f"{ROUTER_USER}@{ROUTER_HOST}",
            command,
        ],
        capture_output=True,
        text=True,
        timeout=15,
        check=False,
    )

    if result.returncode != 0:
        raise RuntimeError(result.stderr.strip())

    return result.stdout.strip()


def read_meminfo(meminfo: str, name: str) -> int:
    match = re.search(
        rf"^{re.escape(name)}:\s+(\d+)",
        meminfo,
        re.MULTILINE,
    )

    if not match:
        return 0

    return int(match.group(1)) * 1024


def read_interface(netdev: str, interface: str) -> dict[str, int]:
    pattern = rf"^\s*{re.escape(interface)}:\s+(.+)$"
    match = re.search(pattern, netdev, re.MULTILINE)

    if not match:
        return {
            "rx_bytes": 0,
            "rx_packets": 0,
            "rx_errors": 0,
            "tx_bytes": 0,
            "tx_packets": 0,
            "tx_errors": 0,
        }

    fields = match.group(1).split()

    return {
        "rx_bytes": int(fields[0]),
        "rx_packets": int(fields[1]),
        "rx_errors": int(fields[2]),
        "tx_bytes": int(fields[8]),
        "tx_packets": int(fields[9]),
        "tx_errors": int(fields[10]),
    }


def wifi_clients(interface: str) -> int:
    output = run_ssh(
        f'wl -i "{interface}" assoclist 2>/dev/null || true'
    )

    return sum(
        1
        for line in output.splitlines()
        if line.startswith("assoclist")
    )


def append_interface_metrics(
    metrics: list[str],
    interface_name: str,
    interface_label: str,
    netdev: str,
) -> None:
    values = read_interface(netdev, interface_name)

    metrics.extend(
        [
            (
                "asus_router_interface_receive_bytes_total"
                f'{{interface="{interface_label}"}} '
                f'{values["rx_bytes"]}'
            ),
            (
                "asus_router_interface_receive_packets_total"
                f'{{interface="{interface_label}"}} '
                f'{values["rx_packets"]}'
            ),
            (
                "asus_router_interface_receive_errors_total"
                f'{{interface="{interface_label}"}} '
                f'{values["rx_errors"]}'
            ),
            (
                "asus_router_interface_transmit_bytes_total"
                f'{{interface="{interface_label}"}} '
                f'{values["tx_bytes"]}'
            ),
            (
                "asus_router_interface_transmit_packets_total"
                f'{{interface="{interface_label}"}} '
                f'{values["tx_packets"]}'
            ),
            (
                "asus_router_interface_transmit_errors_total"
                f'{{interface="{interface_label}"}} '
                f'{values["tx_errors"]}'
            ),
        ]
    )


def collect_metrics() -> str:
    metrics: list[str] = []

    try:
        uptime_seconds = float(
            run_ssh("cut -d' ' -f1 /proc/uptime")
        )

        load_fields = run_ssh("cat /proc/loadavg").split()
        meminfo = run_ssh("cat /proc/meminfo")
        netdev = run_ssh("cat /proc/net/dev")

        memory_total = read_meminfo(meminfo, "MemTotal")
        memory_available = read_meminfo(meminfo, "MemAvailable")

        if memory_available == 0:
            memory_available = (
                read_meminfo(meminfo, "MemFree")
                + read_meminfo(meminfo, "Buffers")
                + read_meminfo(meminfo, "Cached")
            )

        wan_state = run_ssh("nvram get wan0_state_t")
        wan_ip = run_ssh("nvram get wan0_ipaddr")

        wifi_24_enabled = run_ssh("nvram get wl0_radio")
        wifi_5_enabled = run_ssh("nvram get wl1_radio")

        wifi_24_interface = run_ssh("nvram get wl0_ifname")
        wifi_5_interface = run_ssh("nvram get wl1_ifname")

        wifi_24_clients = wifi_clients(wifi_24_interface)
        wifi_5_clients = wifi_clients(wifi_5_interface)

        vpn_up = run_ssh(
            'ip link show tun21 2>/dev/null | grep -q "state UP" '
            '&& echo 1 || echo 0'
        )

        metrics.extend(
            [
                "# HELP asus_router_up Router reachable over SSH.",
                "# TYPE asus_router_up gauge",
                "asus_router_up 1",

                "# HELP asus_router_uptime_seconds Router uptime.",
                "# TYPE asus_router_uptime_seconds gauge",
                f"asus_router_uptime_seconds {uptime_seconds}",

                "# HELP asus_router_load_average Router load average.",
                "# TYPE asus_router_load_average gauge",
                (
                    'asus_router_load_average{period="1m"} '
                    f"{load_fields[0]}"
                ),
                (
                    'asus_router_load_average{period="5m"} '
                    f"{load_fields[1]}"
                ),
                (
                    'asus_router_load_average{period="15m"} '
                    f"{load_fields[2]}"
                ),

                "# HELP asus_router_memory_total_bytes ASUS router total memory in bytes",
                "# TYPE asus_router_memory_total_bytes gauge",
                f"asus_router_memory_total_bytes {memory_total}",

                (
                    "# HELP asus_router_memory_available_bytes "
                    "Available memory."
                ),
                "# TYPE asus_router_memory_available_bytes gauge",
                (
                    "asus_router_memory_available_bytes "
                    f"{memory_available}"
                ),

                "# HELP asus_router_wan_up WAN connection state.",
                "# TYPE asus_router_wan_up gauge",
                f"asus_router_wan_up {1 if wan_state == '2' else 0}",

                "# HELP asus_router_wan_info Current WAN information.",
                "# TYPE asus_router_wan_info gauge",
                f'asus_router_wan_info{{ip="{wan_ip}"}} 1',

                "# HELP asus_router_wifi_radio_up Wi-Fi radio state.",
                "# TYPE asus_router_wifi_radio_up gauge",
                (
                    'asus_router_wifi_radio_up{band="2.4GHz"} '
                    f'{1 if wifi_24_enabled == "1" else 0}'
                ),
                (
                    'asus_router_wifi_radio_up{band="5GHz"} '
                    f'{1 if wifi_5_enabled == "1" else 0}'
                ),

                "# HELP asus_router_wifi_clients Connected Wi-Fi clients.",
                "# TYPE asus_router_wifi_clients gauge",
                (
                    'asus_router_wifi_clients{band="2.4GHz"} '
                    f"{wifi_24_clients}"
                ),
                (
                    'asus_router_wifi_clients{band="5GHz"} '
                    f"{wifi_5_clients}"
                ),

                "# HELP asus_router_vpn_up VPN interface state.",
                "# TYPE asus_router_vpn_up gauge",
                f"asus_router_vpn_up {vpn_up}",
            ]
        )

        append_interface_metrics(
            metrics,
            interface_name="br0",
            interface_label="lan",
            netdev=netdev,
        )

        append_interface_metrics(
            metrics,
            interface_name="ppp0",
            interface_label="wan",
            netdev=netdev,
        )

        append_interface_metrics(
            metrics,
            interface_name="tun21",
            interface_label="vpn",
            netdev=netdev,
        )

    except Exception as error:
        metrics.extend(
            [
                "# HELP asus_router_up Router reachable over SSH.",
                "# TYPE asus_router_up gauge",
                "asus_router_up 0",
                (
                    "# HELP asus_router_collection_error "
                    "Whether metric collection failed."
                ),
                "# TYPE asus_router_collection_error gauge",
                "asus_router_collection_error 1",
            ]
        )

        print(f"Collection error: {error}", flush=True)

    return "\n".join(metrics) + "\n"


class MetricsHandler(BaseHTTPRequestHandler):
    def do_GET(self) -> None:
        if self.path == "/health":
            self.send_response(200)
            self.end_headers()
            self.wfile.write(b"OK\n")
            return

        if self.path != "/metrics":
            self.send_response(404)
            self.end_headers()
            return

        payload = collect_metrics().encode("utf-8")

        self.send_response(200)
        self.send_header(
            "Content-Type",
            "text/plain; version=0.0.4; charset=utf-8",
        )
        self.send_header("Content-Length", str(len(payload)))
        self.end_headers()
        self.wfile.write(payload)

    def log_message(self, *_args) -> None:
        return


if __name__ == "__main__":
    server = HTTPServer(("0.0.0.0", PORT), MetricsHandler)
    print(f"ASUS exporter listening on port {PORT}", flush=True)
    server.serve_forever()
