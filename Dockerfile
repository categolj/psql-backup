FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl ca-certificates gnupg wget

RUN sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt jammy-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update && apt-get install -y postgresql-client

RUN wget https://dl.min.io/client/mc/release/linux-amd64/mc && mv mc /usr/bin && chmod +x /usr/bin/mc
RUN useradd -u 1000 -o -m  cnb
USER cnb
