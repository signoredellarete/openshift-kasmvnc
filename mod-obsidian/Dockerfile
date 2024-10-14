FROM docker.io/kasmweb/ubuntu-jammy-desktop:1.16.0-rolling-weekly

USER root

# Install Obsidian 1.6.7
RUN wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.6.7/obsidian_1.6.7_amd64.deb && \
    dpkg -i obsidian_1.6.7_amd64.deb || apt-get install -f -y && \
    rm obsidian_1.6.7_amd64.deb && \
    echo '[Desktop Entry] \
Name=Obsidian \
Exec=/opt/Obsidian/obsidian %U \
Terminal=false \
Type=Application \
Icon=obsidian \
StartupWMClass=obsidian \
Comment=Obsidian \
MimeType=x-scheme-handler/obsidian; \
Categories=Office;' > /home/kasm-user/Desktop/obsidian.desktop && \
    chmod +x /home/kasm-user/Desktop/obsidian.desktop

