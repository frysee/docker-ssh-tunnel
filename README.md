# Docker SSH Tunnel
Docker SSH Tunnel

Sets up a port forwarding SSH tunnel for one or multiple ports, on one or any number of hosts. Configuration via docker-compose could look like this:

```
version: '3'

services:
  sshtunnel:
    image: frysee/sshtunnel
    container_name: sshtunnel
    volumes:
      - ./sshconfig:/root/.ssh:ro
    environment:
      - TUNNEL_HOST=host.example.com
      - TUNNEL_PORT=22
      - REMOTE_HOST=localhost
      - LOCAL_PORT=2525
      - REMOTE_PORT=25
      - KEY=/data/keyfile
    restart: always
```

## Installation
- Configure port(s)/host(s) in sshconfig/config
- Add ssh key to directory
- Start up with `docker-compose up -d`
