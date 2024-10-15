# Add clock to xfce panel
export DISPLAY=:1.0
DISPLAY=:1.0 /usr/bin/xfce4-panel --add clock

# Create an empty Obsidian Vault
mkdir -p /home/kasm-user/obsidian-vault && \
mkdir -p /home/kasm-user/.config/obsidian && \
echo '{"vaults":{"'$(openssl rand -hex 8)'":{"path":"/home/kasm-user/obsidian-vault","ts":'$(shuf -i 1000000000000-9999999999999 -n 1)',"open":true}}}' > /home/kasm-user/.config/obsidian/obsidian.json
