#https://github.com/pvpgn/pvpgn-server/blob/develop/Dockerfile
# ported to alpine

FROM alpine:latest

ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ARG with_mysql=true
ARG with_sqlite3=false
ARG with_pgsql=false
ARG with_odbc=false
ARG with_lua=true

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
    $(if ${with_mysql}; then echo "mariadb-dev mariadb-connector-c"; fi) \
    $(if ${with_sqlite3}; then echo "sqlite-dev sqlite-libs"; fi) \
    $(if ${with_pgsql}; then echo "libpq-dev libpq"; fi) \
    $(if ${with_odbc}; then echo "unixodbc-dev unixodbc"; fi) \
    $(if ${with_lua}; then echo "lua-dev"; fi) && \
  git clone --depth 1 --single-branch --branch develop https://github.com/pvpgn/pvpgn-server.git pvpgn-server && \
  cd pvpgn-server && \
  cmake -G "Unix Makefiles" -S./ -B./build \
        -DWITH_LUA=${with_lua} \
        -DWITH_MYSQL=${with_mysql} \
        -DWITH_SQLITE3=${with_sqlite3} \
        -DWITH_PGSQL=${with_pgsql} \
        -DWITH_ODBC=${with_odbc} \
        -D CMAKE_INSTALL_PREFIX= && \
  cd build && make -j$(nproc) && make install && \
  apk --quiet del \
      git \
      build-base \
      clang \
      cmake \
      make \
      zlib-dev \
      curl-dev \
      lua-dev \
      $(if ${with_mysql}; then echo "mariadb-dev"; fi) \
      $(if ${with_sqlite3}; then echo "sqlite-dev"; fi) \
      $(if ${with_pgsql}; then echo "libpq-dev "; fi) \
      $(if ${with_pgsql}; then echo "libpq-dev"; fi) \
      $(if ${with_lua}; then echo "lua-dev"; fi) && \
  apk --quiet --no-cache add \
    ca-certificates \
    libstdc++ \
    libgcc \
    libcurl \
    lua5.1-libs \
  rm -rf /var/lib/apt/lists/* /build/pvpgn-server && \
  rm -rf /var/cache/apk/*
  

WORKDIR /usr/local/sbin
