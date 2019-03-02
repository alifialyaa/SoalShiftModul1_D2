#!usr/bin/awk/

awk 'BEGIN{IGNORECASE = 1} /cron/ && !/sudo/' /var/log/syslog | awk 'NF < 13' > /home/alifi/modul1/syslog.log

