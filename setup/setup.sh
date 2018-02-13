#!/bin/bash

set -e
set -x

wget "https://github.com/home-assistant/home-assistant/archive/$1"
echo "$2  $1" | sha256sum -c

mkdir source
cd source
tar -zxf "../$1"
cd *

adduser --uid 2020 --disabled-password --gecos "Home Assistant" hass
mkdir /config
mkdir /opt/homeassistant
chown -R hass:hass /config /tmp/setup /opt/homeassistant

su hass -s /bin/bash -c /tmp/setup/setup-hass.sh
