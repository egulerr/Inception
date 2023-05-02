FROM alpine:3.16

# MariaDB kurulumu için gerekli paketleri kurun
RUN apk update && apk add --no-cache mariadb mariadb-client


RUN mkdir /var/run/mysqld; \
    chown -R mysql:mysql /var/lib/mysql; \
    chmod 777 /var/run/mysqld; \
    { echo '[mysqld]'; \
      echo 'skip-host-cache'; \
      echo 'skip-name-resolve'; \
      echo 'bind-address=0.0.0.0'; \
    } | tee  /etc/my.cnf.d/docker.cnf; \
    sed -i "s|skip-networking|skip-networking=0|g" \
      /etc/my.cnf.d/mariadb-server.cnf

EXPOSE 3306

RUN chown -R mysql:mysql /var/lib/mysql \
    && mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm

# Veritabanının yapılandırılması için gerekli dosyaları oluşturun
COPY /requirements/mariadb/conf/mariadb.conf /etc/mysql/mariadb.conf
COPY /requirements/mariadb/tool/set-table.sql /etc/

RUN /usr/bin/mysqld --user=mysql --bootstrap < /etc/set-table.sql

USER mysql 

# Veritabanını başlatın
CMD  ["mysqld", "--skip-log-error"]