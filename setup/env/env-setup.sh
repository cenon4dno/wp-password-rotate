#!/bin/bash

# ------------ Please configure below -----------------------------#
# 1. Place DB credentials, should be root/admin.                   #
# 2. Place the username, this account will be the auto rotate pass.#
# 3. Cronjob schedule.                                             #
# 4. (optional) Setup the SendGrid.                                #
# -----------------------------------------------------------------#

# Database Information (root/admin)
dbHost='127.0.0.1'
dbUsername='root'
dbPassword='HoneyPaxn97*'
dbName='content'
dbTable='sample_table'
dbColumnForPassword='password'

# Username to change
dbUsernameField='username'
dbUsernameToChangePass='dinno'

# Env config
usernameSSH='cenon4dno'
directoryToCopy='/c/Work/Dev/Repo/wordpress-change-password/temp/'
scheduleCronJob=1
savePassword=1
sendEmai=0

# Cronjob schedule
cronSchedule='****'

# Email for the password change
sendGrid=''