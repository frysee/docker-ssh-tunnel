# Docker SSH Tunnel
Docker SSH Tunnel

Sets up a port forwarding SSH tunnel for one or multiple ports. Configuration via docker-compose could look like this:

```
version: '3'

services:
  sshtunnel:
    image: ghcr.io/frysee/sshtunnel
    container_name: sshtunnel
    restart: unless-stopped
    volumes:
      - ./sshconfig:/root/ssh:ro
    # only necessary if you want to use the tunnel from the host side
    ports:
      - 8081:8081
```

## Installation
- Set up public key authentication on remote host
- Configure port(s)/host(s) in `sshconfig/config`
- Add ssh key to `sshconfig` directory (key name needs to match `IdentityFile` in `sshconfig/config`)
- Start up tunnel with `docker-compose up -d`

## Example SSH Config (exposing ports from a docker-compose setup)
- public key stored as `id_ed25519`
- VPS is reachable at `142.42.63.16`
- ssh auth is set up with user `username`
- Docker service A exposes something at port `8080`
- Docker service B exposes something at port `9000`
- forwarding remote port `8080` to local port `8081`
- forwarding remote port `9000` to local port `9090`

```
Host port-forwards
  # Private key location
  IdentityFile ~/.ssh/id_ed25519
  # Remote host and user
  Hostname 142.42.63.16
  User username
  LocalForward *:8080 localhost:8081
  LocalForward *:9000 localhost:9090
```