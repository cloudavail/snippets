FROM nginx
COPY nginx.conf /etc/nginx/conf.d/gzip.conf
COPY default.conf /etc/nginx/conf.d/default.conf
COPY supervisord.conf /etc/supervisord.conf
COPY provision.sh /provision/provision.sh
COPY entrypoint.sh /provision/entrypoint.sh
COPY ./static /provision/static
RUN /provision/provision.sh

CMD ["/provision/entrypoint.sh"]
