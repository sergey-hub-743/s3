FROM nginx:1.16.0-alpine

COPY app/index.html /usr/share/nginx/html

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx/nginx.conf /etc/nginx/conf.d

HEALTHCHECK --interval=5m --timeout=3s CMD curl --fail http://nginx.host.com/ || exit 1

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
