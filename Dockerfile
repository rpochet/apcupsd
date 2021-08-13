FROM alpine:latest

RUN apk update && apk add --no-cache apcupsd

ADD apcupsd.conf /etc/apcupsd/apcupsd.conf
ADD mqtt_events_publisher.py /etc/apcupsd/mqtt_events_publisher.py

VOLUME [ "/etc/apcupsd", "/var/log/apcupsd" ]

CMD [ "/sbin/apcupsd", "-b" ]
