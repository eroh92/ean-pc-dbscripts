#!/bin/bash
service mysql start
mysql eanprod -e "SET @@global.sql_mode= ''; SET GLOBAL sql_mode='';"
./EAN_MySQL_refresh.sh
echo 'Finished refresh.'
echo 'Cleanup files...'
rm -Rf eanfiles
echo 'Finished cleanup.'
echo 'Starting foreign key setup...'
mysql eanprod < MySQL/MySQL_create_eanprod_fk.sql
echo 'Finished foreign key setup.'
service mysql stop
