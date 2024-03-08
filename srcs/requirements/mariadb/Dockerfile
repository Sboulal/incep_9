FROM debian : bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY tools/db_base.sh /root/script/

COPY conf/server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /root/script/db_base.sh

CMD ["/root/script/db_base.sh"]