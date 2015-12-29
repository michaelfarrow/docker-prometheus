#!/bin/sh

FORMATTED_DNS_SD_NAMES=""

for target in $(echo $DNS_SD_NAMES | tr ',' '\n'); do 
  FORMATTED_DNS_SD_NAMES="$FORMATTED_DNS_SD_NAMES    - '${target}'\n"
done

sed -i "s/%dns_sd_names%/$FORMATTED_DNS_SD_NAMES/" /etc/prometheus/prometheus.yml

/bin/prometheus \
  -config.file=/etc/prometheus/prometheus.yml \
  -storage.local.path=/prometheus \
  -web.console.libraries=/etc/prometheus/console_libraries \
  -web.console.templates=/etc/prometheus/consoles

