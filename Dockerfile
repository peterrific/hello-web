FROM alpine:3.20

# Install nginx and certs
RUN apk add --no-cache nginx ca-certificates && \
    mkdir -p /srv/site /var/cache/nginx /run/nginx

# Config + site
COPY config/nginx.conf /etc/nginx/nginx.conf
COPY site/ /srv/site/

# Run as the nginx user that the package creates
USER nginx

# Nginx listens on 8080 (non-privileged port)
EXPOSE 8080

# Foreground mode so Docker manages the process
CMD ["nginx", "-g", "daemon off;"]
