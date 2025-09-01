#! /bin/bash

BASEURL="http://192.168.10.71:8123/api"

token=$(op read "op://Private/HomeAssistant Arch Key/credential")

function request() {
  curl -s -H "Authorization: Bearer $token" "$BASEURL/$1"
}

humidity=$(request "states/sensor.ikea_of_sweden_vindstyrka_humidity" | jq -r '.state')
temp=$(request "states/sensor.ikea_of_sweden_vindstyrka_temperature" | jq -r '.state')

echo " $humidity%  $temp°C"
