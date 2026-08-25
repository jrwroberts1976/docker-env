# TestServer encrypted secret sources

These are SOPS-encrypted recovery sources. Live services continue using protected host files.

| Encrypted source | Variables | Consumer | Live delivery |
|---|---|---|---|
| `cloudflare-ddns.sops.env` | `CLOUDFLARE_API_TOKEN` | Cloudflare DDNS | `cloudflare-api-token` Compose secret |
| `duckdns.sops.env` | `DUCKDNS_TOKEN` | DuckDNS | `duckdns-token` Compose secret |
| `autokuma.sops.env` | `AUTOKUMA_KUMA_PASSWORD` | AutoKuma | `autokuma-kuma-password` Compose secret |
| `nginx-proxy-manager.sops.env` | `NPM_URL`, `NPM_TOKEN`, `NPM_PROXY_ID` | Maintenance and deployment scripts | protected `npm.env` |
| `contact.sops.env` | `SMTP_USERNAME`, `SMTP_PASSWORD`, `TURNSTILE_SECRET_KEY` | No current runtime consumer; retained for controlled recovery | protected legacy `contact.env` pending retirement |

`AUTOKUMA_KUMA_USERNAME` remains a non-secret variable.

Never commit decrypted output or an age private identity.
A detached offline recovery-identity copy remains outstanding.

## Retired plaintext declarations

| Variable | Former location | Closure |
|---|---|---|
| `CROWDSEC_BOUNCER_API_KEY` | `stacks/crowdsec/.env` | Unused by Compose and runtime; plaintext file removed |
| `WATCHTOWER_SMTP_PASSWORD` | `stacks/management/.env` | Watchtower retired; plaintext file removed |
| `GRAFANA_SMTP_PASSWORD` | `stacks/monitoring/.env` | TestServer Grafana retired; plaintext file removed |
| `SMTP_USERNAME`, `SMTP_PASSWORD`, `TURNSTILE_SECRET_KEY` | `secrets/contact.env` | No runtime consumer; encrypted recovery source retained and plaintext file removed |
| `DUCKDNS_TOKEN` | duplicate `secrets/duckdns_token` environment file | Matched the active Compose secret; duplicate removed |

The active Cloudflare DDNS, DuckDNS and AutoKuma credentials remain file-backed Compose secrets. The Nginx Proxy Manager token remains in its protected host file because deployment and maintenance scripts consume it directly.

TestServer validation completed with both the host operational identity and the protected recovery identity. Five unused or duplicate plaintext files were removed without recreating or restarting any container.
