# Flathub Cache

Simple nginx flathub cache docker image, created from this [amazing blogpost](https://dataswamp.org/~solene/2023-04-05-lan-cache-flatpak.html)

## How to run image

```
docker run -d \
    --name flathub-cache \
    -p 8080:80 \
    -v {your-cache-path}:/var/cache/nginx/flathub/cache
    aquaswim/flathub-cache:latest
```

## Update the flatpak client

```
flatpak remote-modify flathub --url=http://my-cache.local:8080/repo/
```

## Revert the flatpak client

this command to revert the flatpak client to use flathub directly.

```
flatpak remote-modify flathub --url=https://dl.flathub.org/repo/
```
