#!/bin/bash
#
# start.sh liquibase launcher
#
# Version 2014.05.18
#
# Copyright Xavier Garcia <x@vier.im>
# www.xavier-garcia.com
# 
if [ $# = 1 ]; then
 ./bin/liquibase  --defaultsFile=conf/liquibase.properties "--changeLogFile=$1" update
else
 echo usage : $0 workdir/master.xml
fi 
