#!/bin/sh

TAR=`which tar`
if [ -z "$TAR" ]; then
    echo "[!] To use this script you need to install util 'tar'\n Run: apt-get install tar OR yam install tar";
    exit 1
fi
if [ ! -f /etc/codre-backuper.cfg ]; then
    echo "File /etc/codre-backuper.cfg not found!\nRun: sh /usr/share/codre-backuper/config.sh";
fi

echo "$(date +%Y-%m-%d:%H:%M:%S) BACKUP START" >> /var/log/codre.backuper.log;
source /etc/codre-backuper.cfg;
date="$(date +%d_%m_%Y)";

mkdir -p $doc_root/$date;
cd $doc_root/$date;

blacklist=(Database information_schema performance_schema);

for dbname in `echo "show databases;" | mysql -u$username -p$password`; do
	if [[ ${blacklist[*]} =~ $dbname  ]] 
	then
		echo "mysql:skip $dbname" >> /var/log/codre.backuper.log;
	else
		mysqldump -h$host -u$username -p$password $dbname > $dbname.sql &&
		sudo tar -czf $dbname.tar.gz $dbname.sql && rm $dbname.sql
		/usr/share/codre-backuper/supload.sh -u $SELuser -k $SELpass -d 5d $SELkeis/db/$date/ $doc_root/$date/$dbname.tar.gz >> /var/log/codre.backuper.log;
		rm $doc_root/$date/$dbname.tar.gz
		echo "mysql:DEL $dbname.tar.gz" >> /var/log/codre.backuper.log;
	fi
done

cd $doc_root;

rm -Rf $doc_root/$date/

echo "mysql:Done." >> /var/log/codre.backuper.log;

mkdir -p $doc_root/$date;

cd $site_root
blacklist=(vsftpd/)

for sitename in `ls -d -- */`; do
	if [[ ${blacklist[*]} =~ $sitename ]] 
	then
		echo "file:skip $sitename" >> /var/log/codre.backuper.log;
	else
		sudo tar -cjf $doc_root/$date/${sitename%/}.tar.bz2 $sitename
		/usr/share/codre-backuper/supload.sh -u $SELuser -k $SELpass -d 5d $SELkeis/files/$date/ $doc_root/$date/${sitename%/}.tar.bz2 >> /var/log/codre.backuper.log;
		rm $doc_root/$date/${sitename%/}.tar.bz2
		echo "file:DEL ${sitename%/}.tar.bz2" >> /var/log/codre.backuper.log;		
	fi
done

cd $doc_root;

rm -Rf $doc_root/$date

echo "files:Done." >> /var/log/codre.backuper.log;

echo "$(date +%Y-%m-%d:%H:%M:%S) BACKUP END." >> /var/log/codre.backuper.log;