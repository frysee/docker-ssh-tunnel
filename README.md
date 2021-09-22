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
