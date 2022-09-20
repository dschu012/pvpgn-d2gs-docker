FROM debian:bullseye-slim

RUN dpkg --add-architecture i386 \
  && apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y wget \
  && mkdir -pm755 /etc/apt/keyrings \
  && wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key \
  && wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bullseye/winehq-bullseye.sources \
  && apt-get update --allow-insecure-repositories \
  && apt-get install --allow-unauthenticated --install-recommends -y winehq-staging:i386=7.17~bullseye-1  

ENV WINEARCH=win32 WINEPREFIX=/D2GS

WORKDIR /D2GS/drive_c/Diablo2

CMD DISPLAY=:1.0 wine regedit d2gs.reg && touch d2gs.log && wine D2GS.exe & tail -f d2gs.log
