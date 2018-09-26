#!/bin/sh

set -o errexit
set -o verbose

cd /var/tmp/
git clone https://github.com/rob-orb/picberry
cd picberry
make raspberrypi

