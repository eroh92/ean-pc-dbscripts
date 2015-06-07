#!/bin/bash
service mysql start
mysql < /tmp/MySQL_create_eanprod.sql
mysql < /tmp/MySQL_create_eanprod_fk.sql
service mysql stop
