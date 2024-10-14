FROM docker.io/kasmweb/ubuntu-jammy-desktop:1.16.0-rolling-weekly

USER root

# Install Obsidian 1.6.7
RUN wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.6.7/obsidian_1.6.7_amd64.deb && \
    dpkg -i obsidian_1.6.7_amd64.deb || apt-get install -f -y && \
    rm obsidian_1.6.7_amd64.deb && \
    mkdir -p /home/kasm-user/Desktop && \
    printf '[Desktop Entry]\nName=Obsidian\nExec=/opt/Obsidian/obsidian %%U\nTerminal=false\nType=Application\nIcon=obsidian\nStartupWMClass=obsidian\nComment=Obsidian\nMimeType=x-scheme-handler/obsidian;\nCategories=Office;\n' > /home/kasm-user/Desktop/obsidian.desktop && \
    chmod +x /home/kasm-user/Desktop/obsidian.desktop && \
    chown -R kasm-user:kasm-user /home/kasm-user

