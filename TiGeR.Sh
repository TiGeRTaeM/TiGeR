#!/usr/bin/env bash



git clone https://github.com/TiGeRTaeM/TiGeR

cd TiGeR/cli

chmod +x TiGeR.sh

chmod 777 auto.sh && SED -i -e ' S / \ R $ //' auto.sh

./TiGeR.sh install && ./TiGeR .sh
