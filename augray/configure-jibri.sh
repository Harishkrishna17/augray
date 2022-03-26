#!/bin/bash

echo "creating required dirctories and permissions "
mkdir -p /srv/recordings
chown -R jibri:jibri /srv/recordings
chown -R jibri:jibri /srv/finalize-recording.sh


# verify whether you have proper jitsi domain 
out <<< "checking Jitsi FQDN..."
if [[ -z "$JITSI_HOST" ]]; then
    out <<EOF
Aborted! Unknown Jitsi host address
Recommendation: Set Jitsi host address according to the following command
  and try again
    export JITSI_HOST=jitsi.yourdomain.com
EOF
    exit 1
fi

# jitsi fqdn
if [[ -z "$(echo $JITSI_HOST | egrep -o '[a-zA-Z]')" ]]; then
    out <<EOF
Aborted! Jitsi host address is not FQDN: $JITSI_HOST
Recommendation: Don't use an IP address, use a valid FQDN address
EOF
    exit 1
fi

echo "adding host entry"
IP=$(dig +short $JITSI_HOST)
echo $IP
echo "auth.$JITSI_HOST  $IP" >> /etc/hosts

wget -O /etc/jitsi/jibri/jibri.conf  https://kubeace-data.s3.us-east-2.amazonaws.com/augray/jibri.conf
sed -i "s/jitsimeet.augray.com/$JITSI_HOST/g" /etc/jitsi/jibri/jibri.conf
wget -O /srv/finalize-recording.sh https://kubeace-data.s3.us-east-2.amazonaws.com/augray/finalize-recording.sh
chmod +x /srv/finalize-recording.sh

sudo service jibri restart
