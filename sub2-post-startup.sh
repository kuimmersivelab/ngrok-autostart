#!/bin/bash

sleep 3
export WEBHOOK_URL="$(curl http://localhost:4040/api/tunnels | jq ".tunnels[1].public_url")"
echo $WEBHOOK_URL
curl -X PUT "https://kuil.pythonanywhere.com/sub2/update-sub2-url/" -H "Content-Type: application/json" -d "{\"url\": $WEBHOOK_URL}"

