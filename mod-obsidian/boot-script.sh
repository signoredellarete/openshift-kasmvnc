#!/bin/bash
current_date=$(date)
echo $current_date" - boot-script.sh started" >> /home/kasm-user/boot-script.log
rm -rf /tmp/config
git clone https://github.com/signoredellarete/openshift-kasmvnc.git /tmp/config
chmod +x /tmp/config/mod-obsidian/config-script.sh
nohup /tmp/config/mod-obsidian/config-script.sh >> /tmp/config/mod-obsidian/config-script.log 2>&1 &