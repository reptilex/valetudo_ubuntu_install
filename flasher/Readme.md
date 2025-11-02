# Personal recipe for Installation of valetudo roborock s5 on 20.03.2021
## getting flasher pkg
* went to https://builder.dontvacuum.me/
* chose s5
    * Voucher: roborock
    * email (throwaway email)
    * Your SSH-Public key: id_rsa_pi_roborock.pub 
    * Preinstall Valetudo latest
    * Fixresets patch new May 2020 
    * I'm not a robot
* went to email got link for: URL of firmware image
* wget emaillink to flasher folder to get pkg file

## getting language file for german
* from here: https://builder.dontvacuum.me/pkg/voice-s5/
* copied link for: https://builder.dontvacuum.me/pkg/voice-s5/de.pkg

## setting up venv
* Updated system (problem with old python version)
* got python packages:
```sh
python3
python3-pip
python3-venv
python3-setuptools #(needed due to errors)
```
* created venv environment, no pip allowed in venv in ubuntu?? and therefore using system packages: 
```sh
python3 -m venv venv --without-pip --system-site-packages
```
before activating I setup wifi with the roborock

## setting up roborock 
* getting robot with docking station and place near linux computer
* Factory settings reset (missing from valetudo howto): 
    * press 8 sec charge button
    * while still pressing charge press reset
    * keep pressing charge button for 8 sec
    * until voice: resetting to factory settings
* setting up wifi on ubuntu 20.04
```sh
    sudo ip link set wlp3s0 down
    sudo iwconfig wlp3s0 essid "roborock-vacuum-s5_miap57B2"
    sudo dhclient wlp3s0 #takes a while
    sudo ip link set wlp3s0 up
```
* unsetting other lan
```sh
    sudo ip link set eno1 down
```
* check whether I have an ip and all is good
```sh
    sudo ip addr show
```

## Activating venv and adding packages
```sh
    pip3 install python-wheel
    pip3 install python-miio
```
Using mirobo was a problem at first it was not in the path, had to call it with complete path out of: /home/reptilex/.local/bin/mirobo worked after restart though

If the robot goes to sleep, wifi has to be setup again

## Using scripts
* using flasher_reptilex.sh does:
    * gets token via mirobo and saves it in variable
    * calls flasher and expects file to be called v11_002034.pkg and be in same folder
    * will start flashing
    * takes about 5 min
* after that reengage with wifi
* call install_soundfile_reptilex.sh
    * gets token again
    * adds de.pkg to roborock

## Set wlan
* connect to roborock with any computer with roborock wifi
* go to http://192.168.8.1
* setup wifi under settings
* add your wifi data and save
* find roborock with your router
* put roborock back where you want him to always charge

  
## Set wlan for complicated passwords
* connect to roborock with any computer with roborock wifi
* ssh with one of the roborock rsa keys
* change data under /mnt/data/miio to match /mnt/data/miio_rep
* change data under /mnt/data/wlan to match /mnt/data/wlan
  
## DONE

