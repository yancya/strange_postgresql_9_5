
# usage

```sh
docker-compose build

docker-compose up -d pg94
sleep 5
docker-compose run runner94

docker-compose up -d pg95
sleep 5
docker-compose run runner95

docker-compose up -d pg954
sleep 5
docker-compose run runner954

docker-compose up -d pg96
sleep 5
docker-compose run runner96
```

# Result by PostgreSQL 9.4 (Right)

```txt
                                            version

--------------------------------------------------------------------------------
---------------
 PostgreSQL 9.4.8 on x86_64-unknown-linux-gnu, compiled by gcc (Debian 4.9.2-10)
 4.9.2, 64-bit
(1 row)

CREATE TABLE
CREATE INDEX
INSERT 0 3000000
VACUUM
CREATE TABLE
INSERT 0 397
 count
-------
   254
(1 row)

 count
-------
 25400
(1 row)

 count
-------
 25400
(1 row)

 count
-------
 25400
(1 row)

SET
 count
-------
 25400
(1 row)
```

# Result by PostgreSQL 9.5.2 (Strange)

```txt
                                         version

--------------------------------------------------------------------------------
----------
 PostgreSQL 9.5.2 on x86_64-pc-linux-gnu, compiled by gcc (Debian 4.9.2-10) 4.9.
2, 64-bit
(1 row)

CREATE TABLE
CREATE INDEX
INSERT 0 3000000
VACUUM
CREATE TABLE
INSERT 0 397
 count
-------
   254
(1 row)

 count
-------
 25400
(1 row)

 count
-------
 25400
(1 row)

 count
-------
 25300 <- Oops!
(1 row)

SET
 count
-------
 25400
(1 row)
```

# Result by PostgreSQL 9.5.4 (Fixed)

```txt
                                         version

--------------------------------------------------------------------------------
----------
 PostgreSQL 9.5.4 on x86_64-pc-linux-gnu, compiled by gcc (Debian 4.9.2-10) 4.9.
2, 64-bit
(1 row)

CREATE TABLE
CREATE INDEX
INSERT 0 3000000
VACUUM
CREATE TABLE
INSERT 0 397
 count
-------
   254
(1 row)

 count
-------
 25400
(1 row)

 count
-------
 25400
(1 row)

 count
-------
 25400
(1 row)

SET
 count
-------
 25400
(1 row)
```
