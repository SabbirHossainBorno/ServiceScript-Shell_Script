#!/bin/bash

# Replace YOUR_TOKEN with your actual bot token
TOKEN="6875078544:AAFF-CH7QfuL1eNw0fy_TcJBjGy0ExNOe2o"
# Replace YOUR_CHANNEL_ID with your actual channel ID
CHANNEL_ID="-4166289534"
# Original log file to monitor
ORIGINAL_LOG_FILE="/home/syscore/log/syscore-ngd-dc-portal-01-INST_1.log"
# New log file to store processed logs
LOG_FILE="/home/TW241079/BillerOnBoardTracker/biller-syscore-ngd-dc-portal-01-INST_1.log"
# Archive directory
ARCHIVE_DIR="/home/TW241079/BillerOnBoardTracker/archive"
# All biller records CSV file
ALL_RECORDS_CSV="/home/TW241079/BillerOnBoardTracker/all_biller_records.csv"
# Weekly report CSV file
WEEKLY_REPORT_CSV="/home/TW241079/BillerOnBoardTracker/weekly_report.csv"
# Weekly report log file
WEEKLY_REPORT_LOG="/home/TW241079/BillerOnBoardTracker/weekly_report.log"

WEEKLY_REPORT_SENT_FLAG="/home/TW241079/BillerOnBoardTracker/weekly_report_sent_flag"

# Create CSV files and log file if not exist
touch "$ALL_RECORDS_CSV" "$WEEKLY_REPORT_CSV" "$WEEKLY_REPORT_LOG"

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

# Function to check the original log for billers
searching_biller() {
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
          formattedDate=$(date -d "$createdDT" "+%d/%m/%Y")
          #formattedDate=$(date -d "$createdDT" "+%Y-%m-%d" 2>/dev/null || date -jf "%Y-%m-%d" "$createdDT" "+%Y-%m-%d" 2>/dev/null)

          # Debugging output
          log_message "Extracted ServiceNumber: $serviceNumber, CreatedDT: $formattedDate" "$LOG_FILE"

          # Append the new biller information to the all records CSV
          if [ ! -s "$ALL_RECORDS_CSV" ]; then
            echo "SL,Start_Date,Service_number,Status" >> "$ALL_RECORDS_CSV"
          fi
          echo "$(wc -l < "$ALL_RECORDS_CSV"),$formattedDate,$serviceNumber,New Biller" >> "$ALL_RECORDS_CSV"

          # Append the new biller information to the weekly report CSV
          if [ ! -s "$WEEKLY_REPORT_CSV" ]; then
            echo "SL,Start_Date,Service_number,Status" >> "$WEEKLY_REPORT_CSV"
          fi
          total_records=$(wc -l < "$WEEKLY_REPORT_CSV")
          echo "$total_records,$formattedDate,$serviceNumber,New Biller" >> "$WEEKLY_REPORT_CSV"

          # Compose the message
          message=$(echo -e "Alert! New Biller Detected.\nServiceNumber        : $serviceNumber\nStartDate                   : $formattedDate\nStatus                         : New Biller")

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

# Function to check the original log for feeCommission
searching_feeCommission() {
  tail -n0 -F "$ORIGINAL_LOG_FILE" | while read -r line; do
    # Check if the line contains information about a new FeeCommission creation or update
    if [[ $line == *"Calling KOD for product update.KodFeeCommissionRequest KodFeeCommissionRequest"* ]]; then
      log_message "Found calling KOD for update line: $line" "$LOG_FILE"
      process_feeCommission_line "$line" "Updated Fee Commission"
    elif [[ $line == *"Calling KOD for product creation.KodFeeCommissionRequest KodFeeCommissionRequest"* ]]; then
      log_message "Found calling KOD for creation line: $line" "$LOG_FILE"
      process_feeCommission_line "$line" "Created Fee Commission"
    else
      # Log a message if the line does not contain information about a FeeCommission
      log_message "Line does not contain information about a FeeCommission: $line" "$LOG_FILE"
    fi
  done
}

# Function to process FeeCommission line
process_feeCommission_line() {
  local line="$1"
  local status="$2"

  # Extract additional information from the log lines
  local player_id_raw=$(grep -oP 'playerId=\K[^,]+' <<< "$line" | awk '{print $1}')
  local effective_date=$(grep -oP 'effectiveDate=\K[^,]+' <<< "$line" | awk '{print $1}' | sort -u)

  # Debugging output
  log_message "PlayerID: $player_id_raw, EffectiveDate: $effective_date" "$LOG_FILE"

  # Check if playerID and effectiveDate are not empty
  if [[ -n "$player_id_raw" && -n "$effective_date" ]]; then
    log_message "PlayerID and EffectiveDate are not empty" "$LOG_FILE"

    # Convert the effective date and time
    local converted_date=$(date -d "@$((effective_date / 1000))" "+%d/%m/%Y")
    local effective_time=$(date -d "@$((effective_date / 1000))" "+%H:%M:%S")

    # Extracting only the numeric part after the dot in Player ID
    local player_id=$(echo "$player_id_raw" | awk -F'.' '{print $2}')



    # Append the new FeeCommission information to the all records CSV
    if [ ! -s "$ALL_RECORDS_CSV" ]; then
      log_message "Creating new records CSV file" "$LOG_FILE"
      echo "SL,Start_Date,Service_number,Status" >> "$ALL_RECORDS_CSV"
    fi
    echo "$(wc -l < "$ALL_RECORDS_CSV"),$converted_date,$player_id,$status" >> "$ALL_RECORDS_CSV"

    # Append the new FeeCommission information to the weekly report CSV
    if [ ! -s "$WEEKLY_REPORT_CSV" ]; then
      log_message "Creating new weekly report CSV file" "$LOG_FILE"
      echo "SL,Start_Date,Service_number,Status" >> "$WEEKLY_REPORT_CSV"
    fi
    
    total_records=$(wc -l < "$WEEKLY_REPORT_CSV")
    log_message "Appending FeeCommission info to weekly report CSV" "$LOG_FILE"
    echo "$total_records,$converted_date,$player_id,$status" >> "$WEEKLY_REPORT_CSV"

    # Compose the message
    message=$(echo -e "Alert! $status Detected.\nServiceNumber       : $player_id\nEffective Date          : $converted_date\nEffective Time          : $effective_time\nStatus                        : $status")

    # Log the message to the new log file
    log_message "$message" "$LOG_FILE"

    # Send the message to Telegram
    send_message "$message"
  else
    log_message "PlayerID or EffectiveDate is empty" "$LOG_FILE"
  fi
}



# Function to archive the log file daily
archive_log() {
  local timestamp=$(date '+%Y-%m-%d')
  local archive_filename="$ARCHIVE_DIR/biller-syscore-ngd-dc-portal-01-INST_1.log-$timestamp.log"
  mv "$LOG_FILE" "$archive_filename"
  touch "$LOG_FILE"
}

# Function to check and send the weekly report
send_weekly_report() {
  local total_records=$(wc -l < "$WEEKLY_REPORT_CSV")

  if [ "$total_records" -gt 1 ]; then
    # Adjust the count to exclude the header
    total_billers=$((total_records - 1))

    local message=$(echo -e "Weekly Report !\nTotal New Billers In This Week : $total_billers")

    # Send the testing report content and the weekly report file to Telegram in a single message
    if curl -F "chat_id=$CHANNEL_ID" -F "caption=$message" -F "document=@$WEEKLY_REPORT_CSV" "https://api.telegram.org/bot$TOKEN/sendDocument"; then
      log_message "Weekly Report Sent Successfully." "$WEEKLY_REPORT_LOG"
    else
      log_message "Error: Sending Weekly Report." "$WEEKLY_REPORT_LOG"
      return 1  # Returning non-zero to indicate an error
    fi
  else
    # No new biller onboarded in the week
    log_message "N.B: No New Biller On Boarded In This Week." "$WEEKLY_REPORT_LOG"
    log_message "Not Sending The Weekly Report." "$WEEKLY_REPORT_LOG"

    local no_biller_message=$(echo -e "Not Sending The Weekly Report!\nTotal New Billers In This Week : 0")
    send_message "$no_biller_message"
  fi
}

searching_biller > /dev/null 2>&1 &
searching_feeCommission > /dev/null 2>&1 &

# Function to handle daily archive and comparison
daily_archive_and_comparison() {
  current_day=$(date '+%Y-%m-%d')
  current_time=$(date '+%H:%M:%S')
  last_archived_day=$(stat -c %y "$LOG_FILE" | cut -d ' ' -f1)

  if [ "$current_day" != "$last_archived_day" ]; then
    archive_log
  fi
}

# Function to compare two times (including seconds)
compare_times() {
  local current_time="$1"
  local target_time="$2"
  [[ $(date -d "$current_time" +%s) -ge $(date -d "$target_time" +%s) ]]
}

# Function to handle weekly report checking and sending
weekly_report_check_and_send() {
  current_day=$(date '+%Y-%m-%d')
  current_time=$(date '+%H:%M:%S')

  # Check if today is Monday
  if [ "$(date +%u)" -eq 1 ]; then
    log_message "Today is Monday." "$WEEKLY_REPORT_LOG"
    log_message "Current time is: $current_time" "$WEEKLY_REPORT_LOG"

    # Check if today is Monday and the time is between 2:55 PM and 2:56 PM to send the weekly report
    target_start_time="16:50:00"
    target_end_time="16:50:30"

    # Reset the flag file just before the desired target time
    if compare_times "$current_time" "$(date -d "$target_start_time - 1 minute" '+%H:%M:%S')"; then
      rm -f "$WEEKLY_REPORT_SENT_FLAG"
      log_message "Resetting the flag file just before the target time..." "$WEEKLY_REPORT_LOG"
    fi

    if ! [ -e "$WEEKLY_REPORT_SENT_FLAG" ]; then
      # Flag doesn't exist, meaning the report hasn't been sent yet

      if compare_times "$current_time" "$target_start_time" && compare_times "$target_end_time" "$current_time"; then
        log_message "Current time is between 4:50.00 PM and 4:50.30 PM. Resetting and sending weekly report..." "$WEEKLY_REPORT_LOG"
        send_weekly_report
        log_message "Weekly report is already sent Successfully." "$WEEKLY_REPORT_LOG"

        # Sleep for a few seconds to avoid rapid flag creation/removal
        sleep 5

        # Create the flag to indicate that the report has been sent for today
        touch "$WEEKLY_REPORT_SENT_FLAG"
        log_message "Re-Createing the flag file for confirmation that report is already sent" "$WEEKLY_REPORT_LOG"

        rm "$WEEKLY_REPORT_CSV"
        log_message "Removing The Old Weekly Report..DONE" "$WEEKLY_REPORT_LOG"
        touch "$WEEKLY_REPORT_CSV"
        log_message "Re-Creating The Empty-Weekly Report..DONE" "$WEEKLY_REPORT_LOG"

      else
        log_message "Waiting for the target time (4:50.00 PM - 4:50.30 PM)..." "$WEEKLY_REPORT_LOG"
      fi
    else
      log_message "Daily report already sent for today. Not sending again." "$WEEKLY_REPORT_LOG"
    fi
  else
    log_message "Today is not Monday. Waiting for Upcoming Monday." "$WEEKLY_REPORT_LOG"
  fi
}



# Keep the script running until manually stopped
while true; do

  daily_archive_and_comparison
  weekly_report_check_and_send

  sleep 30  # Sleep for 1 minute before checking again
done



# Keep the script running until manually stopped
trap 'kill -TERM $PID' TERM INT
wait $PID
