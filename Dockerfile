# OS
FROM ubuntu:latest
# Set version label
LABEL maintainer="github.com/Dofamin"
LABEL image="MongoDB"
LABEL OS="Ubuntu/latest"
# ARG & ENV
ENV TZ=Europe/Moscow
COPY container-image-root/ /
# Update system packages:
RUN apt -y update > /dev/null 2>&1;\
# Fix for select tzdata region
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone > /dev/null 2>&1;\
    dpkg-reconfigure --frontend noninteractive tzdata > /dev/null 2>&1;\
# Install dependencies, you would need common set of tools.
    apt -y install curl wget ntp libcurl4 openssl liblzma5 gnupg gcc make apt-utils cron > /dev/null 2>&1;\
    echo "deb http://security.ubuntu.com/ubuntu impish-security main" | tee /etc/apt/sources.list.d/impish-security.list > /dev/null 2>&1;\
    apt-get update > /dev/null 2>&1;\
    apt-get install libssl1.1 > /dev/null 2>&1;\
# Download GnuPG key 
    wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add - > /dev/null 2>&1;\
# Download release 
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list > /dev/null 2>&1;\
    apt-get update > /dev/null 2>&1;\
    apt-get install -y mongodb-org > /dev/null 2>&1;\
# Cleanup
    rm -f *.tar.gz > /dev/null 2>&1;\
    apt -y clean > /dev/null 2>&1;
# HEALTHCHECK
# HEALTHCHECK --interval=60s --timeout=30s --start-period=5s CMD curl -f http://localhost:9090 || exit 1
# Expose Ports:
EXPOSE 27017
# ENTRYPOINT
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
