#!/bin/bash

# Replace YOUR_TOKEN with your actual bot token
TOKEN="7110674839:AAHPhh-dqqfA2xvVRlSRpNSAxgybICvWIzA"
# Replace YOUR_CHANNEL_ID with your actual channel ID
CHANNEL_ID="-4185199960"

# Function to send a message to Telegram
send_message() {
  local message="$1"
  curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
    -d "chat_id=$CHANNEL_ID" \
    -d "text=$message"
}

# Compose the message using echo
message=$(echo -e "Alert! Approved Merchant Detected.\nUserName      : MCXXXXXX\nAccountNo     : 013XXXXXXXX")

# Send the message to Telegram
send_message "$message"
