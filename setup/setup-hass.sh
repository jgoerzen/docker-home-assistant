#!/bin/bash

set -e
set -x


cd /opt/homeassistant
python3 -m venv .
source bin/activate

pip3 install --no-cache-dir -r /tmp/setup/source/*/requiremnets_all.txt
pip3 install --no-cache-dir uvloop cchardet

pip3 install /tmp/setup/source/*
