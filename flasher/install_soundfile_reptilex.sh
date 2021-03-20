#!/bin/sh
TOKEN=$(/home/reptilex/.local/bin/mirobo --debug discover --handshake true 2>&1 >/dev/null | grep  -oP "(?<=token: b\').+(?=\')")
mirobo --ip 192.168.8.1 --token $TOKEN --id-file cache_sound_file_install.seq install-sound ./de.pkg
