# OS
FROM ubuntu:latest
# Set version label
LABEL maintainer="github.com/Dofamin"
LABEL image="MongoDB"
LABEL OS="Ubuntu/latest"
# ARG & ENV
WORKDIR /srv/
ENV TZ=Europe/Moscow
# Update system packages:
RUN apt -y update > /dev/null 2>&1;\
# Fix for select tzdata region
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone > /dev/null 2>&1;\
    dpkg-reconfigure --frontend noninteractive tzdata > /dev/null 2>&1;\
# Install dependencies, you would need common set of tools.
    apt -y install curl wget ntp libcurl4 openssl liblzma5 gnupg > /dev/null 2>&1;\
# Download GnuPG key 
    wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add - > /dev/null 2>&1;\
# Download release 
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list > /dev/null 2>&1;\
    apt-get update> /dev/null 2>&1;\
    apt-get install -y mongodb-org > /dev/null 2>&1;\
# Cleanup
    rm -f *.tar.gz > /dev/null 2>&1;\
    apt -y clean > /dev/null 2>&1;
# Change WORKDIR    
WORKDIR /var/log/mongodb/
# HEALTHCHECK
# HEALTHCHECK --interval=60s --timeout=30s --start-period=5s CMD curl -f http://localhost:9090 || exit 1
# Expose Ports:
EXPOSE 27017
# CMD
CMD [ "service ntp start && service mongod start" ]

             