FROM alpine:3.16
RUN apk update && apk add --no-cache bash
RUN apk add nginx
RUN apk add openssl
RUN mkdir -p /etc/nginx/ssl
COPY requirements/nginx/conf/nginx.conf /etc/nginx/http.d/default.conf
RUN openssl req -x509 -nodes -days 365 -subj "/C=TR/ST=ISTANBUL/O=42 ISTANBUL, Inc./CN=eguler" \
        -addext "subjectAltName=DNS:eguler.42.fr" \
        -newkey rsa:2048 -keyout /etc/nginx/ssl/eguler.42.fr.key -out /etc/nginx/ssl/eguler.42.fr.crt;
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]