#!/bin/bash
# Backup a MySQL DB

function show_usage {
        echo "usage: $0 <Backup Directory [/backup]> <Type of backup [DB name]> <Retention days>"
}

if [ $# -ne 3 ]
then
        show_usage
        exit 1
fi

backup_destination="$1"
datecmd="/bin/date"
backupdate=`$datecmd +%d%m%y`
backupcmd="/usr/bin/mysqldump --single-transaction $2"
cd $backup_destination
$backupcmd > $2_$backupdate.sql
echo "$2 DB backup completed on $backupdate" >> /var/log/backup.log

#clean up
days="$3"
cleanupcmd="/usr/bin/find $backup_destination/$2*.sql -mtime +$days -delete"
$cleanupcmd