FROM alpine:latest

RUN apk add --update openssh-client && rm -rf /var/cache/apk/*;

EXPOSE 1-65535
CMD rm -rf /root/.ssh && mkdir /root/.ssh && cp -R /root/ssh/* /root/.ssh/ && chmod -R 600 /root/.ssh/* && \
ssh -vv -4 -tt -N -o StrictHostKeyChecking=no port-forwards;
