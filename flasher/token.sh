#!/bin/sh
token=$(/home/reptilex/.local/bin/mirobo --debug discover --handshake true 2>&1 >/dev/null | grep  -oP "(?<=token: b\').+(?=\')")
echo $token



