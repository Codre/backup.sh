#!/bin/sh

doc_root=/tmp/;
echo "\nSITES DIR:"
read site_root;
echo "\nMySQL HOST:";
read host;
echo "\nMySQL ROOT USER:";
read username;
echo "\nMySQL ROOT PASSWORD:";
read password;
echo "\nStorage login:";
read SELuser;
echo "\nStorage password:";
read SELpass;
echo "\nStorage keis name:";
read SELkeis;

echo "doc_root=\"$doc_root\";\nsite_root=\"$site_root\";\nhost=\"$host\";\nusername=\"$username\";\npassword=\"$password\";\nSELuser=\"$SELuser\";\nSELpass=\"$SELpass\";\nSELkeis=\"$SELkeis\";" > /etc/codre-backuper.cfg;
echo "\nConfig save!";