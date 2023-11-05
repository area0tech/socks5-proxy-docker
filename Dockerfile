FROM alpine:3.18

RUN apk add --no-cache \
	dante-server \
        bash

COPY sockd.conf /etc/
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["sockd"]

EXPOSE 1080
