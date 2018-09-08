FROM nginx:latest
# needed to investigate PID of running process
RUN apt -y update ; apt -y install procps
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh
CMD [ "/entrypoint.sh" ]
