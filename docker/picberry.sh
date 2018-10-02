#!/bin/sh

set -o errexit
set -o verbose

cd /var/tmp/
git clone https://github.com/Rob-Orb/picberry.git
cd picberry
debuild -uc -us
