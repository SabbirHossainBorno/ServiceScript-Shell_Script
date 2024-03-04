#!/bin/bash

# Replace YOUR_TOKEN with your actual bot token
TOKEN="7110674839:AAHPhh-dqqfA2xvVRlSRpNSAxgybICvWIzA"
# Replace YOUR_CHANNEL_ID with your actual channel ID
CHANNEL_ID="-4185199960"
# Original log file to monitor
ORIGINAL_LOG_FILE="/home/syscore/log/syscore-ngd-dc-portal-01-INST_1.log"
# New log file to store processed logs
LOG_FILE="/home/TW241079/BillerOnBoardTracker/biller-syscore-ngd-dc-portal-01-INST_1.log"
# Archive directory
ARCHIVE_DIR="/home/TW241079/BillerOnBoardTracker/archive"

# Function to log messages to a file
log_message() {
  local message="$1"
  local log_file="$2"
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" >> "$log_file"
}

# Function to send a message to Telegram
send_message() {
  local message="$1"
  curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
    -d "chat_id=$CHANNEL_ID" \
    -d "text=$message"
}

# Function to check the original log for billers
check_original_log() {
  tail -n0 -F "$ORIGINAL_LOG_FILE" | while read -r line; do
    # Check if the line contains information about a new biller creation
    if [[ $line == *"Ecs created a new Biller Service (Product) successfully"* ]]; then
      log_message "Found new biller creation line: $line" "$LOG_FILE"

      # Extract additional information from subsequent lines until the next new biller creation line
      while read -r next_line; do
        if [[ $next_line == *"Ecs created a new Biller Service (Product) successfully"* ]]; then
          log_message "Found next biller creation line, stopping extraction" "$LOG_FILE"
          break
        elif [[ $next_line == *"serviceNumber="* && $next_line == *"createdDT="* ]]; then
          serviceNumber=$(grep -oP 'serviceNumber=\K[^,]+' <<< "$next_line")
          createdDT=$(grep -oP 'createdDT=\K[^,]+' <<< "$next_line")

          # Formatting the date to show only yyyy-MM-dd
          formattedDate=$(date -d "$createdDT" "+%Y-%m-%d")

          # Debugging output
          log_message "Extracted ServiceNumber: $serviceNumber, CreatedDT: $formattedDate" "$LOG_FILE"

          # Compose the message
          message=$(echo -e "Alert! Approved Biller Detected.\nServiceNumber        : $serviceNumber\nStartDate                   : $formattedDate")

          # Log the message to the new log file
          log_message "$message" "$LOG_FILE"

          # Send the message to Telegram
          send_message "$message"

          # Break the loop once the information is extracted
          break
        fi
      done
    else
      # Log a message if the line does not contain information about a new biller creation
      log_message "Line does not contain information about a new biller: $line" "$LOG_FILE"
    fi
  done
}

# Function to archive the log file daily
archive_log() {
  local timestamp=$(date '+%Y-%m-%d')
  local archive_filename="$ARCHIVE_DIR/biller-syscore-ngd-dc-portal-01-INST_1.log-$timestamp.log"
  mv "$LOG_FILE" "$archive_filename"
  touch "$LOG_FILE"
}

# Call the function to check the original log for billers in the background
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
