FROM postgres:9.5.4
WORKDIR /var/opt
COPY sample.sql /var/opt/
CMD psql -h pg954 -U postgres -f sample.sql