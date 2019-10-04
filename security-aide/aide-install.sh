#!/bin/bash
# Tested OS: Amazon Linux AMI, CentOS 6
# Code format
# 1. Declare variable all CAPS

# Schedule report vairables
EMAIL_SUBJECT="Aide Report for Web Server"
EMAIL_SENDER="noreply@example.com"
EMAIL_RECIPIENT="webmaster@example.com"

# Install aide
yum -y install aide

# Add custom rules
echo "/var/www/html NORMAL" >> /etc/aide.conf

# Create a schedule for regular check on Daily 9am
echo "0 9 * * * root /usr/sbin/aide -c /etc/aide.conf --check 2>&1 \
| mail -s "$EMAIL_SUBJECT" -S from=$EMAIL_SENDER $EMAIL_RECIPIENT" >> /etc/cron.d/aide

# Create initial DB
/usr/sbin/aide -c /etc/aide.conf --init

# Activate the baseline
/bin/mv -f /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz