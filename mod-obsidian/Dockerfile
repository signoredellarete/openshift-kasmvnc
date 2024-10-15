FROM image-registry.openshift-image-registry.svc:5000/kasm/kasm-ubuntu-jammy-desktop:1.16.0-rolling-weekly

USER root

# Install Obsidian 1.6.7
RUN wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.6.7/obsidian_1.6.7_amd64.deb && \
    dpkg -i obsidian_1.6.7_amd64.deb || apt-get install -f -y && \
    rm obsidian_1.6.7_amd64.deb && \
    mkdir -p /home/kasm-user/Desktop

# Create Obsidian desktop laucher
COPY obsidian.desktop /home/kasm-user/Desktop/obsidian.desktop
COPY xfce4-terminal-emulator.desktop /home/kasm-user/Desktop/xfce4-terminal-emulator.desktop

# Create an empty Obsidian Vault
RUN mkdir -p /home/kasm-user/obsidian-vault && \
    mkdir -p /home/kasm-user/.config/obsidian && \
    echo '{"vaults":{"'$(openssl rand -hex 8)'":{"path":"/home/kasm-user/obsidian-vault","ts":'$(shuf -i 1000000000000-9999999999999 -n 1)',"open":true}}}' > .config/obsidian/obsidian.json

RUN chmod +x /home/kasm-user/Desktop/obsidian.desktop && \
    chmod +x /home/kasm-user/Desktop/xfce4-terminal-emulator.desktop && \
    chown -R kasm-user:kasm-user /home/kasm-user

USER kasm-user