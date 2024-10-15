#!/bin/bash
/usr/bin/xfce4-panel --add clock

# Create an empty Obsidian Vault
mkdir -p /home/kasm-user/obsidian-vault && \
mkdir -p /home/kasm-user/.config/obsidian && \
echo '{"vaults":{"'$(openssl rand -hex 8)'":{"path":"/home/kasm-user/obsidian-vault","ts":'$(shuf -i 1000000000000-9999999999999 -n 1)',"open":true}}}' > .config/obsidian/obsidian.json