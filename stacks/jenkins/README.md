# Jenkins Controller Stack

## Status

This directory is the proposed Git authority for the TestServer Jenkins controller and its Docker-in-Docker sidecar.

It was captured from the proven live configuration on 27 August 2026 and adds the reviewed durable validation-network design. Nothing in this directory should be applied to the live controller until the migration steps below have been independently validated.

## Captured live baseline

The current live controller was observed as:

- controller container: `jenkins`;
- controller image: `homelab-jenkins:lts-jdk21`;
- DinD container: `jenkins-docker`;
- DinD image: `docker:dind`;
- controller port: `8096 -> 8080`;
- Jenkins home: `/home/james/docker/data/jenkins -> /var/jenkins_home`;
- DinD data: `/home/james/docker/data/jenkins-docker -> /var/lib/docker`;
- shared Docker TLS client certificates: `/home/james/docker/data/jenkins-docker-certs -> /certs/client`;
- Jenkins Docker client endpoint: `tcp://docker:2376` with TLS verification enabled;
- DinD daemon argument: `--insecure-registry=192.168.2.220:5000`;
- controller hardening: `no-new-privileges:true`;
- DinD remains privileged because it is the isolated Docker daemon used by Jenkins;
- existing application network: external `homelab_apps`.

The controller Dockerfile is copied exactly from the live non-Git-owned build source captured at `/home/james/projects/Dockerfile` on 27 August 2026.

## Durable validation network

The proposed dedicated transport network is:

```text
network:        jenkins_validation
subnet:         172.30.255.248/29
gateway:        172.30.255.249
Jenkins address: 172.30.255.250
```

This subnet was selected after auditing all TestServer Docker IPv4 subnets, host IPv4 routes, LAN addressing and visible tunnel interfaces. It does not overlap the observed TestServer networks.

Only the Jenkins controller joins `jenkins_validation`. The DinD sidecar remains on `homelab_apps` only.

The Stage 4 SSH validation path will eventually use:

```text
SSH destination:                172.30.255.249
allowed source:                 172.30.255.250/32
validator authorized_keys from: 172.30.255.250
```

The existing dynamic `172.18.0.23/32` trust path must remain in place until the replacement path has been proven end to end.

## Safety boundary

This stack does not grant Jenkins deployment authority.

```text
Stage 4 = COMPLETE
READ-ONLY
credential-store execution proven
deployment.allowed=false
deployment.performed=false
```

The Jenkins controller remains a platform exception. Jenkins may assess Jenkins and propose an update, but Jenkins must not automatically deploy or recreate itself.

## Pre-deployment validation

From this directory, validate the proposed Compose definition without starting or recreating anything:

```bash
docker compose -f docker-compose.yml config --quiet
docker compose -f docker-compose.yml config
```

Before any live change, compare the rendered services against the current containers and confirm the following are unchanged:

- image/build intent;
- persistent mount sources and destinations;
- port publishing;
- Docker TLS environment values;
- DinD daemon argument;
- restart policy;
- controller security options;
- `homelab_apps` membership and `docker` alias for the DinD sidecar.

## Controlled migration order

1. Validate this Git-side Compose definition only; do not run `up` yet.
2. Review and merge the configuration authority change.
3. Synchronize the merged Git authority to TestServer.
4. Create the dedicated validation bridge without changing the running controller where practical.
5. Add the new `172.30.255.250/32` firewall allowance while retaining the existing `172.18.0.23/32` allowance.
6. Add the new validator key source restriction in parallel while retaining the old source temporarily.
7. Migrate/recreate Jenkins through the reviewed Compose definition so the controller joins both networks and receives `172.30.255.250` on `jenkins_validation`.
8. Change the Stage 4 SSH destination from `172.18.0.1` to `172.30.255.249` through a reviewed implementation change.
9. Run the existing Stage 4 read-only Jenkins validation and verify the source address is `172.30.255.250`.
10. Confirm `deployment.allowed=false`, `deployment.performed=false` and the Stop-before-deployment stage still execute as expected.
11. Recreate the controller once through the controlled path and confirm the validation identity remains `172.30.255.250`.
12. Remove the old `172.18.0.23/32` firewall and authorized-key trust only after the new identity is proven.

## Rollback

Until final cutover, the old Stage 4 transport remains available.

If validation fails:

- keep or restore Stage 4 SSH destination `172.18.0.1`;
- retain the existing `172.18.0.23/32` UFW allowance and validator-key source restriction;
- remove Jenkins from `jenkins_validation` if necessary;
- leave Stage 4 deployment authority disabled;
- do not proceed to Stage 5 deployment work.
