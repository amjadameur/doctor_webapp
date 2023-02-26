FROM mariadb:10.11

ENV MYSQL_ALLOW_EMPTY_PASSWORD="yes"
ENV MYSQL_USER="doctorDbAdmin"
ENV MYSQL_PASSWORD="aJKYdtRKZaY4Zq5Y"
ENV MYSQL_DATABASE="dpp"

COPY dpp.sql /docker-entrypoint-initdb.d/dpp.sql
