FROM alpine:latest

RUN apk add --update openssh-client && rm -rf /var/cache/apk/*;

CMD ssh port-forwards;
EXPOSE 1-65535