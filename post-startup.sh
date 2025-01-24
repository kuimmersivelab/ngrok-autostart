#!/bin/bash

sleep 3
export WEBHOOK_URL="$(curl http://localhost:4040/api/tunnels | jq ".tunnels[0].public_url")"
echo $WEBHOOK_URL
curl -X PUT "https://kuil.pythonanywhere.com/update-ngrok-url/" -H "Content-Type: application/json" -d "{\"url\": $WEBHOOK_URL}"
curl -X PUT "http://localhost:6000/update-sub1-url/" -H "Content-Type: application/json" -d "{\"url\": \"http://talon_fsl:8000\"}"
curl -X PUT "http://localhost:6000/update-sub2-url/" -H "Content-Type: application/json" -d "{\"url\": \"http://subserver:7000\"}"

