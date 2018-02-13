FROM jgoerzen/debian-base-security:jessie AS debian-addons

FROM homeassistant/home-assistant:0.63.1
MAINTAINER John Goerzen <jgoerzen@complete.org>

COPY --from=debian-addons /usr/local/preinit/ /usr/local/preinit/
COPY --from=debian-addons /usr/local/bin/ /usr/local/bin/
COPY --from=debian-addons /usr/local/debian-base-setup/ /usr/local/debian-base-setup/

RUN run-parts --verbose /usr/local/debian-base-setup

CMD ["/usr/local/bin/boot-debian-base"]
