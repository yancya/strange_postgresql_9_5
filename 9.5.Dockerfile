FROM postgres:9.5
WORKDIR /var/opt
COPY sample.sql /var/opt/
CMD psql -h pg95 -U postgres -f sample.sql