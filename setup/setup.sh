#!/bin/bash

# 1. Setup environment variables
#   1.1 Set host, username and password for the database
#   1.2 Set cronjob schedule
# 2. Copy shell scripts
# 3. Setup cronjob to run shell script

echo 'Setup Start...'
. env/env-setup.sh

echo 'Copy scripts...'
command1="sudo cp ../src/* $directoryToCopy"
eval $command1 >> "logs/setup.log"

echo 'Copy environment variables...'
command2="sudo cp env/* $directoryToCopy/src/env/"
eval $command2 >> "logs/setup.log"

echo 'Set cron job...'
# Create a cron file
command3="touch /var/spool/cron/$usernameSSH"
eval $command3 >> "logs/setup.log"
command4="/usr/bin/crontab /var/spool/cron/$usernameSSH"
eval $command4 >> "logs/setup.log"
# Create a job
command5="echo '0 0 * * * $directoryToCopy/src/main.sh' >> /var/spool/cron/$usernameSSH"
eval $command5 >> "logs/setup.log"

echo 'Setup End...'