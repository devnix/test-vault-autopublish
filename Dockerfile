FROM debian

ARG OBSIDIAN_VERSION=1.7.7

ADD "https://github.com/obsidianmd/obsidian-releases/releases/download/v${OBSIDIAN_VERSION}/obsidian_${OBSIDIAN_VERSION}_amd64.deb" ./obsidian.deb
RUN apt update -y && apt install -y libasound2 xvfb ./obsidian.deb && rm ./obsidian.deb

# Set up virtual display
ENV DISPLAY=:99
CMD ["sh", "-c", "Xvfb :99 -screen 0 1024x768x24 & exec obsidian --no-sandbox"]
