FROM --platform=linux/386 i386/ubuntu:18.04

WORKDIR /var/app

# Install "red" dependencies
RUN apt-get update
RUN apt-get install -y curl libc6 libcurl4

# Download Red Stable
ADD https://static.red-lang.org/dl/linux/red-064  /usr/local/bin/red
RUN /bin/bash -c "chmod +x /usr/local/bin/red"

CMD ["/usr/local/bin/red", "--no-view"]
