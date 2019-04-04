FROM jgoerzen/debian-base-security:stretch AS debian-addons

FROM homeassistant/home-assistant:0.91.0
MAINTAINER John Goerzen <jgoerzen@complete.org>

COPY --from=debian-addons /usr/local/preinit/ /usr/local/preinit/
COPY --from=debian-addons /usr/local/bin/ /usr/local/bin/
COPY --from=debian-addons /usr/local/debian-base-setup/ /usr/local/debian-base-setup/

RUN run-parts --exit-on-error --verbose /usr/local/debian-base-setup

COPY setup/ /usr/local/debian-base-setup/
COPY files/ /usr/local/debian-base-setup/files/
RUN /usr/local/debian-base-setup/100-home-assistant
COPY preinit/ /usr/local/preinit/

CMD ["/usr/local/bin/boot-debian-base"]
