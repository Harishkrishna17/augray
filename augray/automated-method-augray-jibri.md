# jibri Base Installer

`jitsi-base-installer` installs a simple standalone Jitsi server. This script
guides the user during the installation to avoid potential problems.

## Supported distributions

- Debian 11 Bullseye
- Debian 10 Buster
- Ubuntu 20.04 Focal Fossa

## Usage

- Don't use this script on a working production server.
- Run it as `root`
- Follow the recommendations during the installation

# The following ports need to be open in your firewall, to allow traffic to the Jitsi Meet server:

5222 TCP - jibri communication to XMPP server

## pre-requisites 

- Make sure you have alsa modules loaded 

This can be verified using `modprobe snd-aloop` , if it returs `snd-aloop failed to load in kernel` 

### use root account

Switch to the `root` account if you are not already `root`. Use one of the
following commands according to your system to be `root`:

```bash
sudo -i 
```

### download installer

```bash
apt-get update
apt-get install wget
wget -O jibri-base-installer https://raw.githubusercontent.com/Harishkrishna17/jitsi-doc/master/augray/install-jibri-dep.sh
```

## Export the host names 

```bash
export JITSI_HOST=jitsimeet.augray.com
```

### run the installer

```bash
bash install-jibri-dep.sh
```
## configure jibri 

``` bash 
wget -O configure-jibri https://raw.githubusercontent.com/Harishkrishna17/jitsi-doc/master/augray/configure-jibri.sh
```

## run the recorder configuration script 

```bash
bash configure-jibri
```

# once the successfull execution , stop jibri 

``` bash 
sudo service jibri stop 
```

# Restart the jitsi services in jitsi machine 

``` bash 
sudo service prosody stop && sudo service jicofo stop && sudo service jitsi-videobridge2 stop
sudo service prosody start && sleep 5 && sudo service jicofo start && sleep 5 && sudo service jitsi-videobridge2 start
```

# start the jibri server 

```
sudo service jibri start 
```
