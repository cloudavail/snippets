FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    yes | add-apt-repository ppa:chris-needham/ppa && \
    apt-get update && \
    apt-get install audiowaveform -y
