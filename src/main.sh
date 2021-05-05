#!/bin/bash
. ./env/env-setup.sh
echo "Start Running (Change password for $dbUsernameToChangePass)..."

# variables
datetime=$(date '+%Y-%m-%d %H:%M')
echo "Application executed on $datetime" >> "logs/history.log"

# 1. Generate new password for the user
newPassword=$(openssl rand -base64 12)
echo "new password: $newPassword"
echo "$datetime : new password: $newPassword" >> "logs/password.log"
# 2. Encrypt password
newEncryptedPass=$(echo -n $newPassword | md5sum | awk '{print $1}')
echo "new encrypted password: $newEncryptedPass"
# 3. Change user password in DB
echo 'Change user password...'
mysql -u$dbUsername -p$dbPassword $dbName <<EOFMYSQL
SELECT $dbUsernameField, $dbColumnForPassword FROM $dbTable WHERE $dbUsernameField='$dbUsernameToChangePass';
UPDATE $dbTable SET $dbColumnForPassword='$newEncryptedPass' WHERE $dbUsernameField='$dbUsernameToChangePass';
SELECT $dbUsernameField, $dbColumnForPassword FROM $dbTable WHERE $dbUsernameField='$dbUsernameToChangePass';
EOFMYSQL
echo "Stop Running (Change password for $dbUsernameToChangePass)..."