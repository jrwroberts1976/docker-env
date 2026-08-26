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

## Deployment automation closure

The obsolete repository-level **Deploy Training Platform** GitHub Actions
workflow was removed on 26 August 2026.

The workflow still triggered on every push to `main`, on manual dispatch and
on `content-updated` repository-dispatch events. It attempted to update all
submodules, enable maintenance mode, rebuild the retired image and run the
retired deployment script. Its recurring failures were notification noise, not
an active infrastructure incident.

Removing the workflow:

- stops automatic and manually dispatched Training Platform deployments;
- prevents unrelated `main` changes from attempting to rebuild retired content;
- does not delete source, submodules or Git history;
- does not change a container, image, route, proxy host, runner or service; and
- does not remove the explicit recovery constraints below.

## Recovery

The previous Compose definition remains available through Git history.
The pre-retirement operational copy was also captured outside the
repository during the controlled retirement.

Do not restore this container without first defining its supported
route, content ownership, build provenance and health check.
