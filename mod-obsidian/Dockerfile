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
COPY boot-script.sh /home/kasm-user/boot-script.sh

# Adjust some file permissions and ownership
RUN chmod +x /home/kasm-user/Desktop/obsidian.desktop && \
    chmod +x /home/kasm-user/Desktop/xfce4-terminal-emulator.desktop && \
    chown -R kasm-user:kasm-user /home/kasm-user && \
    mkdir /tmp/config && \
    chown -R kasm-user:kasm-user /tmp/config

USER kasm-user
RUN bash /home/kasm-user/boot-script.sh