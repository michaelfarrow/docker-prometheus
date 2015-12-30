#!/bin/sh

FORMATTED_DNS_SD_NAMES=""

for target in $(echo $DNS_SD_NAMES | tr ',' '\n'); do 
  FORMATTED_DNS_SD_NAMES="$FORMATTED_DNS_SD_NAMES    - '${target}'\n"
done

sed -i "s/%dns_sd_names%/$FORMATTED_DNS_SD_NAMES/" /etc/prometheus/prometheus.yml
sed -i "s/%scrape_interval%/$SCRAPE_INTERVAL/" /etc/prometheus/prometheus.yml
sed -i "s/%job_name%/$JOB_NAME/" /etc/prometheus/prometheus.yml
sed -i "s/%auth_user%/$AUTH_USER/" /etc/prometheus/prometheus.yml
sed -i "s/%auth_pass%/$AUTH_PASSWORD/" /etc/prometheus/prometheus.yml

sed -i "s/%relabel_source_labels%/$RELABEL_SOURCE_LABELS/" /etc/prometheus/prometheus.yml
sed -i "s/%relabel_regex%/$RELABEL_REGEX/" /etc/prometheus/prometheus.yml
sed -i "s/%relabel_replacement%/$RELABEL_REPLACEMENT/" /etc/prometheus/prometheus.yml
sed -i "s/%relabel_modulus%/$RELABEL_MODULUS/" /etc/prometheus/prometheus.yml
sed -i "s/%relabel_target_label%/$RELABEL_TARGET_LABEL/" /etc/prometheus/prometheus.yml
sed -i "s/%relabel_action%/$RELABEL_ACTION/" /etc/prometheus/prometheus.yml

cat /etc/prometheus/prometheus.yml

/bin/prometheus \
  -config.file=/etc/prometheus/prometheus.yml \
  -storage.local.path=/prometheus \
  -web.console.libraries=/etc/prometheus/console_libraries \
  -web.console.templates=/etc/prometheus/consoles

