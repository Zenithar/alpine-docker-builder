FROM alpine:edge
MAINTAINER Thibault NORMAND <me@zenithar.org>

# ENV http_proxy http://<your-proxy>:8080
# ENV https_proxy http://<your-proxy>:8080

RUN apk add --update musl iptables ca-certificates \
    lxc e2fsprogs docker make openssh-client perl \
    device-mapper

# If using a private docker registry with self signed certificate
# ADD ./docker-ca.crt /usr/local/share/ca-certificates/
# RUN update-ca-certificates

ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

VOLUME /var/lib/docker
CMD ["wrapdocker"]
