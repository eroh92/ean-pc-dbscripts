#!/bin/bash
service mysql start
mysql eanprod -e "SET @@global.sql_mode= ''; SET GLOBAL sql_mode='';"
./EAN_MySQL_refresh.sh
service mysql stop
