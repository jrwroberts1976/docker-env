# TestServer encrypted secret sources

These are SOPS-encrypted recovery sources. Live services continue using protected host files.

| Encrypted source | Variables | Consumer | Live delivery |
|---|---|---|---|
| `cloudflare-ddns.sops.env` | `CLOUDFLARE_API_TOKEN` | Cloudflare DDNS | `cloudflare-api-token` Compose secret |
| `duckdns.sops.env` | `DUCKDNS_TOKEN` | DuckDNS | `duckdns-token` Compose secret |
| `autokuma.sops.env` | `AUTOKUMA_KUMA_PASSWORD` | AutoKuma | `autokuma-kuma-password` Compose secret |
| `nginx-proxy-manager.sops.env` | `NPM_URL`, `NPM_TOKEN`, `NPM_PROXY_ID` | Maintenance and deployment scripts | protected `npm.env` |

`AUTOKUMA_KUMA_USERNAME` remains a non-secret variable.

Never commit decrypted output or an age private identity.
A detached offline recovery-identity copy remains outstanding.
