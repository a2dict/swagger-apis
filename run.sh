#!/bin/ash

# author: a2dict
# date: 2019-09-13 15:59:04

set -e

cp -rf /apis/ /usr/share/nginx/html/

# input files
INPUT=$1
INPUT=${INPUT:-"/apis/"}

# output file
OUTPUT=$2
OUTPUT=${OUTPUT:-"/usr/share/nginx/html/apis/swagger-config.json"}

SWAGGER_CONFIG=`cd $INPUT;find . -type f -name '*.swagger.json'|sed 's/.//'|sort|while read line
do
    echo "{\"name\":\"${line:1}\",\"url\":\"/apis${line}\"}"

done |tr '\n' ','|sed 's/.$//'|sed 's/$/]}/'|sed 's/^/{"urls":[/'`

echo $SWAGGER_CONFIG  > $OUTPUT 

# fix permission-denied
chmod -R 777 /usr/share/nginx/html/apis/
exec sh /usr/share/nginx/run.sh