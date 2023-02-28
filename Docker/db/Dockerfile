FROM mariadb:10.11

ENV MYSQL_ALLOW_EMPTY_PASSWORD="yes"
ENV MYSQL_USER="doctorDbAdmin"
ENV MYSQL_PASSWORD="aJKYdtRKZaY4Zq5Y"
ENV MYSQL_DATABASE="dpp"

RUN apt-get update && apt-get install -y \
  git \
  && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/thegr8dev/doctorpatientportal /tmp/doctor \
  && cp /tmp/doctor/sqlfiles/dpp.sql /docker-entrypoint-initdb.d/dpp.sql \
  && rm -rf /tmp/doctor
