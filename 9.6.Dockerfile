FROM postgres:9.6
WORKDIR /var/opt
COPY sample.sql /var/opt/
CMD psql -h pg96 -U postgres -f sample.sql