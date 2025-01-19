#!/bin/bash

ngrok http http://localhost:8000 > /dev/null & && export WEBHOOK_URL="$(curl http://localhost:4040/api/tunnels | jq ".tunnels[0].public_url")" && echo $WEBHOOK_URL && curl -X PUT "https://kuil.pythonanywhere.com/update-ngrok-url/" -H "Content-Type: application/json" -d "{\"url\": $WEBHOOK_URL}"
