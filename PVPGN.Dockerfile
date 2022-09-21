FROM alpine:latest AS build

### Install build dependencies
RUN apk --quiet --no-cache add \
  git \
  build-base \
  clang \
  cmake \
  make \
  zlib-dev \
  curl-dev \
  lua-dev \
  mariadb-dev \
  && rm -rf /var/cache/apk/*

RUN git clone --depth 1 --single-branch --branch develop https://github.com/pvpgn/pvpgn-server.git /src
RUN mkdir /src/build /usr/local/pvpgn
WORKDIR /src

RUN cmake -G "Unix Makefiles" -H./ -B./build \
  -D WITH_LUA=true \
  -D WITH_MYSQL=true \
  -D WITH_SQLITE3=false \
  -D WITH_PGSQL=false \
  -D WITH_ODBC=false \
  -D CMAKE_INSTALL_PREFIX=/pvpgn \
  ../ && cd build  \
  && make \
  && make install

FROM alpine:latest AS runner

RUN apk --quiet --no-cache add \
  ca-certificates \
  libstdc++ \
  libgcc \
  libcurl \
  lua5.1-libs \
  mariadb-connector-c \
  && rm -rf /var/cache/apk/*

COPY --from=build \
  /pvpgn/sbin/bnetd \
  /pvpgn/sbin/bntrackd \
  /pvpgn/sbin/d2cs \
  /pvpgn/sbin/d2dbs \
  /sbin/

COPY --from=build \
  /pvpgn/bin/bn* \
  /pvpgn/bin/sha1hash \
  /pvpgn/bin/tgainfo \
  /bin/

COPY --from=build /pvpgn/etc/pvpgn /pvpgn/etc/pvpgn
COPY --from=build /pvpgn/var/pvpgn /pvpgn/var/pvpgn