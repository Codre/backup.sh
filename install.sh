#!/bin/sh
mkdir /usr/share/codre-backuper/;
cd /usr/share/codre-backuper/;
wget https://raw.githubusercontent.com/Codre/backup.sh/master/config.sh && chmod +x config.sh;
wget https://raw.githubusercontent.com/Codre/backup.sh/master/backup.sh && chmod +x backup.sh;
wget https://raw.github.com/selectel/supload/master/supload.sh && chmod +x supload.sh;
sh config.sh;
