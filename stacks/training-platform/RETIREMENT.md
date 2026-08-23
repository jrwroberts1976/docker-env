# Training Platform Container Retirement

Retired from the active Docker estate on 23 August 2026.

## Reason

The MkDocs development container had been stopped since 6 August 2026
and was no longer serving an active route.

Validation before retirement:

- container state was `exited`;
- port `8090` had no listener;
- Nginx Proxy Manager had no route to `training-platform` or port `8090`;
- `https://me.jrwroberts.co.uk/training/` returned HTTP 404;
- the previous build reported obsolete and missing navigation content;
- source repositories and Git history remain preserved.

## Recovery

The previous Compose definition remains available through Git history.
The pre-retirement operational copy was also captured outside the
repository during the controlled retirement.

Do not restore this container without first defining its supported
route, content ownership, build provenance and health check.
