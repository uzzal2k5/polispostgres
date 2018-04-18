FROM postgres:9.6-alpine
MAINTAINER uzzal, uzzal2k5@gmail.com

#RUN mkdir /docker-entrypoint-initdb.d
COPY db_setup_draft.sql /polis_db_setup.sql
COPY db.sh /docker-entrypoint-initdb.d/polisdb.sh
#RUN chmod a+x db.sh && sh db.sh
#RUN psql -U polis polis < /docker-entrypoint-initdb.d/polis_db_setup.sql



