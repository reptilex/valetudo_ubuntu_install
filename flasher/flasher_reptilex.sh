#!/bin/sh
TOKEN=$(/home/reptilex/.local/bin/mirobo --debug discover --handshake true 2>&1 >/dev/null | grep  -oP "(?<=token: b\').+(?=\')")
IP='192.168.8.57'
#URL="https://builder.dontvacuum.me/jobs/j605594c160aa9/0b025b17bf9fcc4c3026ed698b0c9291/v11_002034.pkg"
#MD5="0b025b17bf9fcc4c3026ed698b0c9291"
URL="./v11_002034.pkg"
/home/reptilex/.local/bin/mirobo --ip 192.168.8.1 --token $TOKEN --id-file cache_flasher.seq update-firmware --ip $LINUXIP $URL

