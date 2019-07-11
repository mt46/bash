**Sample cronjobs**

Daily schedule  
`50 1 * * * root /bin/sh /opt/backup_db.sh /mnt/backup/ website-db-daily 30`

Monthly schedule  
`50 0 1 * * root /bin/sh /opt/backup_db.sh /mnt/backup/ website-db-monthly 712`