#!/bin/bash

# Replace YOUR_TOKEN with your actual bot token
TOKEN="6388529613:AAG0s5aXptTqjCN4UbtjlwxABABm1JQdL2k"
# Replace YOUR_CHANNEL_ID with your actual channel ID
CHANNEL_ID="-4181708561"
# Original log file to monitor
ORIGINAL_LOG_FILE="/home/syscore/log/syscore-ngd-dc-portal-01-INST_1.log"
# New log file to store processed logs
LOG_FILE="/home/TW241079/MerchantOnBoard/mc-syscore-ngd-dc-portal-01-INST_1.log"
# Archive directory
ARCHIVE_DIR="/home/TW241079/MerchantOnBoard/archive"

# Function to log messages to a file
log_message() {
  local message="$1"
  local log_file="$2"
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" | tee -a "$log_file"
}

# Function to send a message to Telegram
send_message() {
  local message="$1"
  curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
    -d "chat_id=$CHANNEL_ID" \
    -d "text=$message"
}

# Function to check the original log for approved and active merchants
check_original_log() {
  processed_merchants=()  # Array to store processed merchant registrations

  tail -n0 -F "$ORIGINAL_LOG_FILE" | while read -r line; do
    # Check if the line contains information about an approved merchant registration
    if echo "$line" | grep -q "approvalStatus=ApprovalStatus(value=APPROVED)" && echo "$line" | grep -q "taskType=MERCHANT_REGISTRATION"; then
      # Extract relevant information from the log
      accountNo=$(echo "$line" | grep -oP 'accountNo=\K[^,]+')
      username=$(echo "$line" | grep -oP 'username=\K[^,]+')

      # Check if this registration has already been processed
      if ! echo "${processed_merchants[@]}" | grep -q "$accountNo"; then
        # Add the registration to the processed list
        processed_merchants+=("$accountNo")

        # Compose the message
        #message="::Alert:: Approved Merchant Detected.\nUsername   : $username\nAccountNo : $accountNo"
        message=$(echo -e "Alert! Approved Merchant Detected.\nUserName      : $username\nAccountNo     : $accountNo")

        # Log the message to the new log file
        log_message "$message" "$LOG_FILE"

        # Send the message to Telegram
        send_message "$message"
      fi
    fi
  done
}

# Function to archive the log file daily
archive_log() {
  local timestamp=$(date '+%Y-%m-%d')
  local archive_filename="$ARCHIVE_DIR/mc-syscore-ngd-dc-portal-01-INST_1.log-$timestamp.log"
  mv "$LOG_FILE" "$archive_filename"
  touch "$LOG_FILE"
}

# Call the function to check the original log for merchants in the background
check_original_log &

# Check and perform daily log archiving every minute
while true; do
  current_day=$(date '+%Y-%m-%d')
  last_archived_day=$(stat -c %y "$LOG_FILE" | cut -d ' ' -f1)

  if [ "$current_day" != "$last_archived_day" ]; then
    archive_log
  fi

  sleep 60  # Sleep for 1 minute before checking again
done

# Keep the script running until manually stopped
trap 'kill -TERM $PID' TERM INT
wait $PID
