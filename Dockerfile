FROM prom/prometheus:0.16.1

MAINTAINER Mike Farrow <contact@mikefarrow.co.uk>

ENV DNS_SD_NAMES ''

ADD config/prometheus.yml /etc/prometheus/prometheus.yml

ADD config/start.sh /opt/bin/prometheus-start.sh
RUN chmod u=rwx /opt/bin/prometheus-start.sh

ENTRYPOINT [ "/opt/bin/prometheus-start.sh" ]

CMD []
