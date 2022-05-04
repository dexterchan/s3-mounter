#!/bin/sh

set -e

echo "$AWS_KEY:$AWS_SECRET_KEY" > passwd && chmod 600 passwd
#s3fs "$S3_BUCKET" "$MNT_POINT" -o passwd_file=passwd  && tail -f /dev/null

s3fs "$S3_BUCKET" "$MNT_POINT" -f -o passwd_file=passwd,endpoint=${S3_REGION},nonempty,allow_other,use_cache=/tmp,max_stat_cache_size=1000,stat_cache_expire=900,retries=5,connect_timeout=10 && tail -f /dev/null

