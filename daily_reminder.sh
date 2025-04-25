#!/bin/bash

WEBHOOK_URL="https://mattermost.example.com/hooks/token"
CHANNEL="daily"
USERNAME="Grzegorz"
COUNTRY="PL"

TODAY=$(date +"%Y-%m-%d")

HOLIDAY_API="https://openholidaysapi.org/PublicHolidays?countryIsoCode=$COUNTRY&languageIsoCode=EN&validFrom=$TODAY&validTo=$TODAY"

IS_HOLIDAY=$(curl -s -X GET "$HOLIDAY_API")

if [[ "$IS_HOLIDAY" != "[]" ]]; then
  exit 0
fi

read -r -d '' PAYLOAD <<EOF
{
  "text": "@channel \n#### Time for our daily at *10:00* 🎉 \n👉 [Join us here 🎙️](https://meet.google.com/abcd1234)\n**We’re starting in a moment - see you there! :eyes:**",
  "channel": "$CHANNEL",
  "username": "$USERNAME"
}
EOF

curl -s -X POST -H 'Content-Type: application/json' -d "$PAYLOAD" "$WEBHOOK_URL"