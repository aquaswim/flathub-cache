FROM nginx

LABEL maintainer="Aquaswim <bayusetiawan37@gmail.com>"

# add local files
COPY /root /

RUN chown -R www-data:www-data /opt/flathub_cache/

VOLUME /var/cache/nginx/flathub