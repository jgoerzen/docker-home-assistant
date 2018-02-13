FROM jgoerzen/debian-base-security:stretch
MAINTAINER John Goerzen <jgoerzen@complete.org>

RUN mv /usr/sbin/policy-rc.d.disabled /usr/sbin/policy-rc.d && \
    apt-get update && \
    apt-get -y -u dist-upgrade && \
    apt-get -y --no-install-recommends install \
       python3-venv python3-dev python3-all python3-pip ffmpeg openalpr \
       cython3 python3-mysqldb python3-psycopg2 \
       tox nodejs \
       build-essential libcurl3-dev libglib2.0-dev libbluetooth-dev libudev-dev \
       nmap net-tools bluetooth libsodium18 \
       locales python-certbot && \
    apt-get clean && rm -rf /tmp/setup /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    /usr/local/bin/docker-wipelogs && \
    mv /usr/sbin/policy-rc.d /usr/sbin/policy-rc.d.disabled

RUN locale-gen en_US.UTF-8 en_us && dpkg-reconfigure locales && locale-gen C.UTF-8 && /usr/sbin/update-locale LANG=C.UTF-8
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8


COPY setup/ /tmp/setup

# FIXME: consolidate these later
RUN /tmp/setup/setup.sh 0.63.1.tar.gz 450f510083a6c6fa4ccd6859f809b4ad75ce721931018be9c0088ae354305105
RUN su -s /bin/bash -c /tmp/setup/setup-hass.sh hass
RUN rm -r /tmp/setup



