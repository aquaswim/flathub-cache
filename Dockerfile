FROM nginx

LABEL maintainer="Aquaswim <bayusetiawan37@gmail.com>"

# add local files
COPY /root /

VOLUME /var/cache/nginx/flathub