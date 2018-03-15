FROM mysql
ENV MYSQL_ROOT_PASSWORD h8rCLzbBBA4h
# The EXPOSE instruction informs Docker that the container listens on the specified network ports at runtime.
# The EXPOSE instruction does not actually publish the port.
# see: https://docs.docker.com/engine/reference/builder/#expose
COPY world.sql /docker-entrypoint-initdb.d/
EXPOSE 3306
