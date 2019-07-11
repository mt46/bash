#!/bin/bash
# Backup a directory

function show_usage {
        echo "usage: $0 <Source Directory [/var/www/html]> <Destination Directory [/backup]> <Type of backup> <Retention Days>"
}

if [ $# -ne 4 ]
then
        show_usage
        exit 1
fi

backup_source="$1"
backup_destination="$2"
datecmd="/bin/date"
backupdate=`$datecmd +%d%m%y`

#clean up
days="$4"
cleanupcmd="/usr/bin/find $backup_destination/$3_*.tgz -mtime +$days -delete"
$cleanupcmd

backupcmd="/bin/tar -C $backup_source --ignore-failed-read --numeric-owner -zcplf $3_$backupdate.tgz ."
cd $backup_destination
$backupcmd
echo "$3 backup completed on $backupdate" >> /var/log/backup.log