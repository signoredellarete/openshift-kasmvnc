FROM image-registry.openshift-image-registry.svc:5000/kasm/kasm-ubuntu-jammy-desktop:1.16.0-rolling-weekly

USER root

# Install Obsidian 1.6.7
RUN wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.6.7/obsidian_1.6.7_amd64.deb && \
    dpkg -i obsidian_1.6.7_amd64.deb || apt-get install -f -y && \
    rm obsidian_1.6.7_amd64.deb && \
    mkdir -p /home/kasm-user/Desktop
# COPY obsidian.desktop /home/kasm-user/Desktop/obsidian.desktop
# COPY test-file.txt /home/kasm-user/test-file.txt
# RUN chmod +x /home/kasm-user/Desktop/obsidian.desktop && \
RUN chown -R kasm-user:root /home/kasm-user

