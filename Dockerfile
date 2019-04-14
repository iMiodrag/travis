# Pull Image
FROM ubuntu:18.04

# No interaction
ENV DEBIAN_FRONTEND=noninteractive 

WORKDIR /scripts/

# Composer
ADD composer.json /scripts/
ADD composer.lock /scripts/
ADD tests/ /scripts/tests/
ADD run_tests.sh /scripts/

# INSTALL
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  apt-get install -y php php-pear php-fpm php-dev php-zip php-curl php-xmlrpc php-gd php-mysql php-mbstring php-xml libapache2-mod-php && \ 
  apt-get install -y --no-install-recommends && \
  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
  composer install --optimize-autoloader && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  chmod +x /scripts/run_tests.sh

# Set environment variables.
ENV HOME /root

# Define default command.
CMD ["bash"] 
