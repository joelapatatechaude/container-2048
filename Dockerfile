FROM nginx:1.25.4

COPY 2048 /usr/share/nginx/html

RUN sed -i 's/80;/8888;/g' etc/nginx/conf.d/default.conf

EXPOSE 8888

RUN chgrp -R root /var/cache/nginx /var/run /var/log/nginx && \
    chmod -R 770 /var/cache/nginx /var/run /var/log/nginx

USER 10001

#CMD ["nginx", "-version"]
CMD ["nginx", "-g", "daemon off;"]
