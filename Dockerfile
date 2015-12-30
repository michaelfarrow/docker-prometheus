FROM prom/prometheus:0.16.1

MAINTAINER Mike Farrow <contact@mikefarrow.co.uk>

ENV DNS_SD_NAMES ''
ENV JOB_NAME prometheus
ENV SCRAPE_INTERVAL 30s

ENV RELABEL_ACTION replace
ENV RELABEL_REGEX (.*)
ENV RELABEL_REPLACEMENT '${1}'

ADD config/prometheus.yml /etc/prometheus/prometheus.yml

ADD config/start.sh /opt/bin/prometheus-start.sh
RUN chmod u=rwx /opt/bin/prometheus-start.sh

ENTRYPOINT [ "/opt/bin/prometheus-start.sh" ]

CMD []
