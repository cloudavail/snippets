FROM ubuntu:16.04
RUN apt -y update
RUN echo 'mysql-server mysql-server/root_password password root' | debconf-set-selections
RUN echo 'mysql-server mysql-server/root_password_again password root' | debconf-set-selections
RUN apt -y install mysql-server
# find /var/lib/mysql -type f -exec touch {} is required to resolve issue with MySQL failing to start
# https://github.com/docker/for-linux/issues/72
# the touching of files (find /var/lib/mysql -type f -exec touch {} \;)
# and launch of mysql (service mysql start)
# need to be done within the same run statement
RUN find /var/lib/mysql -type f -exec touch {} \; && \
    service mysql start
# apt -y install procps required to run "ps" command
RUN apt -y install procps
# my expectation was that the command (ps aux) below should show MySQL running
# my expectation was wrong, however
RUN echo "Below is ps aux without chained shell commands"
RUN ps aux
# but if I do this differently, MySQL remains running
RUN echo "Below is ps aux with chained shell commands"
RUN find /var/lib/mysql -type f -exec touch {} \; && \
    service mysql start && \
    ps aux

