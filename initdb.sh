#!/bin/bash
service mysql start
mysql < /tmp/MySQL_create_eanprod.sql
service mysql stop
