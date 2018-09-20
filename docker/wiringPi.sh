#!/bin/sh

set -o errexit
set -o verbose

cd /var/tmp/
git clone git://git.drogon.net/wiringPi
cd wiringPi
./build

