#On choisit une debian
FROM php:8.2-apache

#LABEL org.opencontainers.image.authors="github@diouxx.be"


#Ne pas poser de question à l'installation
#ENV DEBIAN_FRONTEND noninteractive

#Installation d'apache et de php8.1 avec extension
RUN apt update \
#&& apt install --yes ca-certificates apt-transport-https lsb-release wget curl \
#&& curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg \ 
#&& sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list' \
#&& apt update \
&& apt install --yes --no-install-recommends \
#apache2 \
#php8.1 \
php8.2-mysql \
php8.2-ldap \
php8.2-xmlrpc \
php8.2-imap \
php8.2-curl \
php8.2-gd \
php8.2-mbstring \
php8.2-xml \
php-cas \
php8.2-intl \
php8.2-zip \
php8.2-bz2 \
php8.2-redis \
cron \
jq \
libldap-2.4-2 \
libldap-common \
libsasl2-2 \
libsasl2-modules \
libsasl2-modules-db \
&& rm -rf /var/lib/apt/lists/*

#Copie et execution du script pour l'installation et l'initialisation de GLPI
COPY glpi-start.sh /opt/
RUN chmod +x /opt/glpi-start.sh
ENTRYPOINT ["/opt/glpi-start.sh"]

#Exposition des ports
EXPOSE 80 443
