#!/bin/bash

set -e
set -x

export LANG=C.UTF-8
export LANGUAGE=C.UTF-8
export LC_ALL=C.UTF-8


cd /opt/homeassistant
python3 -m venv .
source bin/activate

pip3 install --no-cache-dir -r /tmp/setup/source/*/requirements_all.txt
pip3 install --no-cache-dir uvloop cchardet

pip3 install /tmp/setup/source/*
