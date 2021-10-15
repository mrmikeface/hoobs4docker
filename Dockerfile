FROM jrei/systemd-debian:latest

RUN apt update && apt install -y curl lsb-release && \
      curl -s https://dl.hoobs.org/stable | bash - && \
      apt install -y hoobsd hoobs-cli && \
      apt clean
ENV PORT 80
COPY hoobs.sh /hoobs.sh
VOLUME /hoobs
USER root
CMD ["/lib/systemd/systemd"]
#ENTRYPOINT ["/usr/bin/hbs", "--container", "install", "-p", "$PORT"]
ENTRYPOINT ["/hoobs.sh"]
