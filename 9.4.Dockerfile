FROM postgres:9.4
WORKDIR /var/opt
COPY sample.sql /var/opt/
CMD psql -h pg94 -U postgres -f sample.sql  