#!/bin/sh

set -e
# cd /app && php think queue:listen --queue CardCancelQueue &
# cd /worker && php start.php start -d &
cd /app && php think queue:listen --queue OrderTask --timeout 3600 

crond && crontab /crond

php -a
