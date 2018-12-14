#!/bin/bash

echo "`date` | [Info] | Start | Start Backup"
mkdir /backup
cd /backup
echo "*:*:*:*:${POSTGRES_PASSWORD}" > /root/.pgpass
chmod 0600 /root/.pgpass
pg_dump ${POSTGRES_DB} -c --host=${POSTGRES_HOST} --user ${POSTGRES_USER} > dump.sql 2> .error \
	&& echo "`date` | [Info] | SQL | Backup sql" \
	|| echo "`date` | [Error] | SQL | `cat .error`"
backup_name="${SERVICE_NAME}_`date +%Y-%m-%d'_'%H_%M_%S`.tar"
tar cf ${backup_name} /backup > /dev/null 2> .error \
	&& echo "`date` | [Info] | Tar backup | Tar of the backup" \
	|| echo "`date` | [Error] | Tar backup | `cat .error`"
rm -rf backup
curl --fail --silent --show-error -T ${backup_name} ftp://${FTP_HOST} --user "${FTP_USER}:${FTP_PASSWORD}" 2> .error \
	&& echo "`date` | [Info] | FTP | backup archive send to ftp" \
	|| echo "`date` | [Error] | FTP | `cat .error`"
rm ${backup_name}
echo "`date` | [Info] | End | End of Backup"
