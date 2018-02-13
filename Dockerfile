FROM jgoerzen/debian-base-security:stretch
MAINTAINER John Goerzen <jgoerzen@complete.org>

RUN mv /usr/sbin/policy-rc.d.disabled /usr/sbin/policy-rc.d && \
    apt-get update && \
    apt-get -y -u dist-upgrade && \
    apt-get -y --no-install-recommends install \
       python3-venv python3-pip ffmpeg openalpr \
       python3-cython python3-mysqldb python3-psycopg2 \
       tox nodejs \
       nmap net-tools bluetooth libsodium13 && \
    apt-get clean && rm -rf /tmp/setup /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    /usr/local/bin/docker-wipelogs && \
    mv /usr/sbin/policy-rc.d /usr/sbin/policy-rc.d.disabled

COPY setup/ /tmp/setup

# FIXME: consolidate these later
RUN /tmp/setup/setup.sh 0.63.1.tar.gz 450f510083a6c6fa4ccd6859f809b4ad75ce721931018be9c0088ae354305105
RUN /tmp/setup/setup-hass.sh
RUN rm -r /tmp/setup



