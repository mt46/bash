**Sample cronjobs**

Daily backup

`1 1 * * * root /bin/sh /opt/backup.sh /var/www/html /mnt/backup/daily webdir-daily 30`

Monthly backup

`0 0 1 * * root /bin/sh /opt/backup.sh /var/www/html /mnt/backup/monthly webdir-monthly 712`

