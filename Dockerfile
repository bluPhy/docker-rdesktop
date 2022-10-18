FROM ghcr.io/linuxserver/baseimage-rdesktop:arch-dbus-latest

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"

RUN \
  echo "**** install packages ****" && \
  pacman -Sy --noconfirm --needed \
    firefox \
    mate \
    mate-media \
    mate-terminal \
    pavucontrol \
    pluma && \
  echo "**** cleanup ****" && \
  rm -rf \
    /tmp/* \
    /var/cache/pacman/pkg/* \
    /var/lib/pacman/sync/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 3389
VOLUME /config
