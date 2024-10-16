FROM image-registry.openshift-image-registry.svc:5000/kasm/kasm-ubuntu-jammy-desktop:1.16.0-rolling-weekly

USER root

# Install Obsidian 1.6.7 & cron
RUN wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.6.7/obsidian_1.6.7_amd64.deb && \
    dpkg -i obsidian_1.6.7_amd64.deb || apt-get install -f -y && \
    rm obsidian_1.6.7_amd64.deb && \
    mkdir -p /home/kasm-user/Desktop && \
    apt-get update && \
    apt-get install -y cron

# Create Obsidian desktop laucher
COPY obsidian.desktop /home/kasm-user/Desktop/obsidian.desktop
COPY xfce4-terminal-emulator.desktop /home/kasm-user/Desktop/xfce4-terminal-emulator.desktop
COPY custom_startup.sh /dockerstartup/custom_startup.sh && \
COPY config-daemon.sh /home/kasm-user/conf-daemon.sh


# Adjust some file permissions and ownership
RUN chmod +x /home/kasm-user/Desktop/obsidian.desktop && \
    chmod +x /home/kasm-user/Desktop/xfce4-terminal-emulator.desktop && \
    chmod +x /dockerstartup/custom_startup.sh && \
    chmod +x /home/kasm-user/conf-daemon.sh && \
    chown -R kasm-user:kasm-user /home/kasm-user

USER kasm-user
