#!/usr/bin/env bash

# Read input variables
STAGE=$1
STATUS=$2

# Default message
# ${currentBuild.currentResult}
# ${STAGE_NAME}
MESSAGE=""$STAGE" failed :no_entry:"
if [ $STATUS = "SUCCESS" ]; then
    MESSAGE=""$STAGE" (api-tests) passed :white_check_mark:"
fi

# Send notification
curl -X POST \
  https://discordapp.com/api/webhooks/*/* \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
  -d '{
	"content":"'"$MESSAGE"'"
}'
