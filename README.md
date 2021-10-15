Runs Hoobs4 on Debian with systemd

Volumes: `/hoobs` config location

Variables: `PORT` - port for hoobs webserver

For running:

```bash
docker run -d --name hoobs \
  --restart always \
  --network host \
  --tmpfs /tmp \
  --tmpfs /run \
  --tmpfs /run/lock \
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
  -v /home/$USER/hoobs:/hoobs \
  mikeknowles/hoobs:latest
```

Docs for cli can be found here https://support.hoobs.org/docs

Docker hub: https://hub.docker.com/repository/docker/mikeknowles/hoobs
