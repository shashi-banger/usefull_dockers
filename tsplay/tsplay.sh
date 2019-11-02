#1/bin/bash

if [ $# -ne 5 ]
then
    echo "Usage: tsplay.sh <s3_url> <AWS_ACCESS_KEY_ID> <AWS_SECRET_ACCESS_KEY> <DEST_IP> <DEST_PORT>"
    exit 1
fi

S3_URL=${1}
ACCESS_KEY_ID=${2}
SECRET_ACCESS_KEY=${3}
DEST_IP=${4}
DEST_PORT=${5}
S3_BUCKET=`echo ${S3_URL:5} | sed -e "s/\/.*//"`
S3_PATH=`echo ${S3_URL:5} | sed -e "s/[_A-Za-z0-9\-]*\///"`
echo ${ACCESS_KEY_ID}:${SECRET_ACCESS_KEY} > /tmp/passwd
chmod 600 /tmp/passwd
mkdir /mnt/s3/
s3fs ${S3_BUCKET} /mnt/s3/ -o passwd_file=/tmp/passwd -o use_cache=/tmp/

AV_FILE_PATH=/mnt/s3/${S3_PATH}
tsplay ${AV_FILE_PATH} ${DEST_IP}:${DEST_PORT} -loop
