FROM ubuntu:20.04

WORKDIR /app

# Install "red" dependencies
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y curl libc6:i386 libcurl4:i386 libgtk-3-0:i386 libgdk-pixbuf2.0-0:i386

# Download Stable
ADD https://static.red-lang.org/dl/linux/red-064  /red/red-stable
RUN /bin/bash -c "chmod +x /red/red-stable"

# Downlaod Latest
ADD https://static.red-lang.org/dl/auto/linux/red-latest  /red/red-latest
RUN /bin/bash -c "chmod +x /red/red-latest"

# Enable Aliases
RUN echo 'if test -f "/app/aliases.sh"; then source /app/aliases.sh; fi' >> /root/.bashrc
