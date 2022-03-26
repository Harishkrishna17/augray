# Jitsi Base Installer

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

## pre-requisites 

### host addresses

- Create a `DNS A record` for Jitsi. For example `jitsi.yourdomain.com`
- Create a `DNS A record` for TURN. For example `turn.yourdomain.com`
- Jitsi address and TURN address must be different and don't use an IP as the
  host address
- Set related environment variables before starting the installer

## The following ports need to be open in your firewall, to allow traffic to the Jitsi Meet server:

* 80 TCP - for SSL certificate verification / renewal with Let's Encrypt
* 443 TCP - for general access to Jitsi Meet
* 10000 UDP - for general network video/audio communications
* 22 TCP - if you access you server using SSH (change the port accordingly if it's not 22)
* 3478 UDP - for quering the stun server (coturn, optional, needs config.js change to enable it)
* 5349 TCP - for fallback network video/audio communications over TCP (when UDP is blocked for example), served by coturn
* 5222 TCP - jibri communication to XMPP server 

### use root account

Switch to the `root` account if you are not already `root`. Use one of the
following commands according to your system to be `root`:

```bash
sudo su -l
```

or

```bash
su -l
```

### download installer

```bash
apt-get update
apt-get install wget
wget -O jitsi-base-installer https://raw.githubusercontent.com/Harishkrishna17/jitsi-doc/master/augray/jitsi-base-installer
```

## Export the host names 

```bash
export JITSI_HOST=jitsimeet.augray.com
export TURN_HOST=turn.augray.com
```

### run the installer

```bash
bash jitsi-base-installer
```


## useful commands 

* To verify number of conference

```
curl localhost:8888/stats
```

