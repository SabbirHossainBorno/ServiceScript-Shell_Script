#!/bin/bash
#------------------------------------------|
# Reset                                    | 
Color_Off='\033[0m'       # Text Reset     |
#                                          |
# Regular Colors                           |
Black='\033[0;30m'        # Black          |
Red='\033[0;31m'          # Red            |
Green='\033[0;32m'        # Green          |
Yellow='\033[0;33m'       # Yellow         |
Blue='\033[0;34m'         # Blue           |
Purple='\033[0;35m'       # Purple         |
Cyan='\033[0;36m'         # Cyan           |
White='\033[0;37m'        # White          |
#                                          |
# Bold                                     |
BBlack='\033[1;30m'       # Black          |
BRed='\033[1;31m'         # Red            |
BGreen='\033[1;32m'       # Green          |
BYellow='\033[1;33m'      # Yellow         |
BBlue='\033[1;34m'        # Blue           |
BPurple='\033[1;35m'      # Purple         |
BCyan='\033[1;36m'        # Cyan           |
BWhite='\033[1;37m'       # White          |
#                                          |
# Underline                                |
UBlack='\033[4;30m'       # Black          |
URed='\033[4;31m'         # Red            |
UGreen='\033[4;32m'       # Green          |
UYellow='\033[4;33m'      # Yellow         |
UBlue='\033[4;34m'        # Blue           |
UPurple='\033[4;35m'      # Purple         |
UCyan='\033[4;36m'        # Cyan           |
UWhite='\033[4;37m'       # White          |
#                                          |
# Background                               |
On_Black='\033[40m'       # Black          |
On_Red='\033[41m'         # Red            |
On_Green='\033[42m'       # Green          |
On_Yellow='\033[43m'      # Yellow         |
On_Blue='\033[44m'        # Blue           |
On_Purple='\033[45m'      # Purple         |
On_Cyan='\033[46m'        # Cyan           |
On_White='\033[47m'       # White          |
#                                          |
# High Intensity                           |
IBlack='\033[0;90m'       # Black          |
IRed='\033[0;91m'         # Red            |
IGreen='\033[0;92m'       # Green          |
IYellow='\033[0;93m'      # Yellow         |
IBlue='\033[0;94m'        # Blue           |
IPurple='\033[0;95m'      # Purple         |
ICyan='\033[0;96m'        # Cyan           |
IWhite='\033[0;97m'       # White          |
#                                          |
# Bold High Intensity                      |
BIBlack='\033[1;90m'      # Black          |
BIRed='\033[1;91m'        # Red            |
BIGreen='\033[1;92m'      # Green          |
BIYellow='\033[1;93m'     # Yellow         |
BIBlue='\033[1;94m'       # Blue           |
BIPurple='\033[1;95m'     # Purple         |
BICyan='\033[1;96m'       # Cyan           |
BIWhite='\033[1;97m'      # White          |
#                                          |
# High Intensity backgrounds               |
On_IBlack='\033[0;100m'   # Black          |
On_IRed='\033[0;101m'     # Red            |
On_IGreen='\033[0;102m'   # Green          |
On_IYellow='\033[0;103m'  # Yellow         |
On_IBlue='\033[0;104m'    # Blue           |
On_IPurple='\033[0;105m'  # Purple         |
On_ICyan='\033[0;106m'    # Cyan           |
On_IWhite='\033[0;107m'   # White          |
#------------------------------------------|

NB() {
echo
echo -e "${BIYellow}*|_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_|*${Color_Off}"
echo
echo -e "${BIRed}              UNDER MAINTANANCE               ${Color_Off}"
echo
echo -e "${BIRed}         SORRY FOR THE INCONVENIENT           ${Color_Off}"
echo
echo -e "${BIYellow}*|_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_|*${Color_Off}"
echo
}




#-----------------------------------------------------DEVINFO-------------------------------------------------------

devloper_INFO() {
echo
echo -e "${BIRed}SCRIPT MANAGER(1.0.0)${Color_Off}"
echo -e "${BIYellow}*----------------------------------------*${Color_Off}"
echo -e "${BRed}TODAY                : ${Color_Off}${BYellow}`date +"%d-%m-%Y"` ${Color_Off}"
echo -e "${BRed}LAST UPDATE          : ${Color_Off}${BYellow}29-02-2024 ${Color_Off}"
echo -e "${BRed}PREVIOUS IMPLEMENTED : ${Color_Off}${BYellow}N/A ${Color_Off}"
echo -e "${BRed}LAST IMPLEMENTED     : ${Color_Off}${BYellow}INITIAL ${Color_Off}"
echo -e "${BIYellow}*----------------------------------------*${Color_Off}"
echo -e "${BRed}IMPLEMENTED BY MD. SABBIR HOSSAIN BORNO ${Color_Off}"
echo -e "${BRed}System Engineer - Remittance Operation${Color_Off}"
echo -e "${BRed}NAGAD LIMITED${Color_Off}"
echo
}

# Call the function
devloper_INFO
NB
#--------------------------------------------------------FINISH-------------------------------------------------------

#-------------------------------------------------------ScriptMenu-------------------------------------------------------

ScriptMenu() {
echo
echo -e "*${BCyan}-----------------${Color_Off}${URed}MAIN MENU${Color_Off}${BCyan}---------------${Color_Off}*"
echo -e "*${BBlue}[1]${Color_Off}-------${BGreen}Run Script${Color_Off}                     *"
echo -e "*${BBlue}[2]${Color_Off}-------${BGreen}Terminate Script${Color_Off}               *"
echo -e "*${BBlue}[3]${Color_Off}-------${BGreen}Restart Script${Color_Off}                 *"
echo -e "*${BBlue}[PC]${Color_Off}------${BGreen}Process Check${Color_Off}                  *"
echo -e "*${BCyan}------------------${Color_Off}${URed}FINISH${Color_Off}${BCyan}-----------------${Color_Off}*"
echo -e "${BCyan}|----------${Color_Off}${BIPurple}PRESS [e] FOR EXIT${Color_Off}${BCyan}-------------|${Color_Off}"
echo 
echo -e "${BCyan}PRESS & ENTER PLEASE:${Color_Off} " 
echo
}


ScriptList() {
# Script List
echo
echo -e "${BYellow}1${Color_Off}${BRed}.${Color_Off} ${BGreen}MerchantOnBoard${Color_Off}"
echo -e "${BYellow}2${Color_Off}${BRed}.${Color_Off} ${BGreen}BillerOnBoardTracker${Color_Off}"
echo
echo -e "${BIPurple}PRESS [e] FOR GO-BACK${Color_Off}"
echo
}
#--------------------------------------------------------FINISH-------------------------------------------------------

#-----------------------------------------------------Authenticate-------------------------------------------------------

# Define your Telegram bot token and group ID
TELEGRAM_BOT_TOKEN="7052270145:AAFdGB8R_azZofywvQAlt9XUD7SP7hubOUs"
TELEGRAM_GROUP_ID="-4113315208"

# Function to send a message to Telegram
send_telegram_message() {
    local message="$1"
    curl -s -X POST "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" \
        -d "chat_id=${TELEGRAM_GROUP_ID}" \
        -d "text=${message}" \
        -d "parse_mode=Markdown" > /dev/null  # Redirect output to /dev/null to suppress it
}

# Function to send login alert
send_login_alert() {
    local username="$1"
    local login_time="$2"
    local message=$(echo -e "Alert! Login Detect In \`Script Manager\`.\nUser                  : $username\nLogin Time      : $login_time")
    send_telegram_message "$message"
}

# Function to send logout alert
send_logout_alert() {
    local username="$1"
    local login_time="$2"
    local logout_time="$3"
    #local message="*Alert!* Script Manager Logout Approved.\n\n\UserName: ${username}\n\Login Time: ${login_time}\n\Logout Time: ${logout_time}\n\Logout By: ${logout_by}"
    local message=$(echo -e "Alert! Logout From \`Script Manager\`.\nUser                  : $username\nLogin Time      : $login_time\nLogout Time   : $logout_time")
    send_telegram_message "$message"
}


# Get the directory of the script
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Full path to the main script
main_script="$script_dir/ScriptManager.sh"



# User/Password database
declare -A users
users["Admin"]="6655"
users["sabbir.borno@nagad.com.bd"]="6655"


# Function to append login information to the text file
append_login_info() {
    local username="$1"
    local login_time="$2"
    local exit_time="$3"

    if [ "$login_time" != "Access Denied" ]; then
        # Get the current serial number from the existing content of the file
        if [ -f /home/TW241079/ScriptManager/.ScriptManagerUserLoginInfo ]; then
            entry_count=$(wc -l < /home/TW241079/ScriptManager/.ScriptManagerUserLoginInfo)
        else
            entry_count=0
        fi

        # Increase the entry_count for each valid entry
        entry_count=$((entry_count + 1))

        # Create a formatted login info string with the correct serial number
        local login_info="$(printf '%-7s | %-25s | %-19s | %-19s' "$entry_count" "$username" "Login Time: $login_time" "Logout Time: $exit_time")"

        # Append the formatted login info to the file
        echo "$login_info" >> /home/TW241079/ScriptManager/.ScriptManagerUserLoginInfo
    fi
}


    force_exit="Press CTRL+C"

    # Trap Ctrl+C and execute the functions before exiting
    #trap 'append_login_info "$username" "$login_time" "$force_exit"; exit' INT
    trap 'send_logout_alert "$username" "$login_time" "$(date +'\''%Y-%m-%d %H:%M:%S'\'')" "$force_exit" && exit' INT

# Function to authenticate the user
authenticate() {
    echo -e "${BIPurple}-----------------------------${Color_Off}"
    echo -e "${BIPurple}|${Color_Off}${BIYellow}  Authentication Required  ${Color_Off}${BIPurple}|${Color_Off}"
    echo -e "${BIPurple}-----------------------------${Color_Off}"
    echo
    read -p $'\e[1;36mEnter Your Email:\e[0m ' username
    read -p $'\e[1;36mEnter Your Password:\e[0m ' -s password
    echo

    login_time=$(date +'%Y-%m-%d %H:%M:%S')

    if [ -n "$username" ] && [ -n "$password" ] && [ -n "${users[$username]}" ] && [ "$password" = "${users[$username]}" ]; then
        echo
        echo -e "${BIGreen}-----------------------------${Color_Off}"
        echo -e "${BIGreen}|${Color_Off}      ${BIGreen}Access Granted!${Color_Off}      ${BIGreen}|${Color_Off}"
        echo -e "${BIGreen}-----------------------------${Color_Off}"
        echo

        # Send login alert to Telegram
        send_login_alert "$username" "$login_time"

    else
        echo
        echo -e "${BIRed}-----------------------------${Color_Off}"
        echo -e "${BIRed}|${Color_Off}      ${BIRed}Access Denied!${Color_Off}       ${BIRed}|${Color_Off}"
        echo -e "${BIRed}-----------------------------${Color_Off}"
        echo
        exit 1
    fi
}

authenticate





#-------------------------------------------------------FINISH----------------------------------------------------------


ALL_SCRIPT_DIR="/home/TW241079"

#-----------------------------------------------------AllFunction-------------------------------------------------------
get_script_list() {
    local count=0
    for script_dir in "$ALL_SCRIPT_DIR"/*/; do
        ((count++))
        echo "$count. $(basename "$script_dir")"
    done
}

# Function to check if a script is running
is_script_running() {
    local script_name="$1"
    pgrep -f "$script_name" > /dev/null
}

start_script() {
    local script_name="$1"
    local script_path="${ALL_SCRIPT_DIR}/${script_name}/${script_name}.sh"
    if is_script_running "$script_name"; then
        echo -e "${BRed}Script${Color_Off} ${BYellow}$script_name${Color_Off} ${BRed}Is Already Running. \nPlease Terminate The Script First.${Color_Off}"
        echo
        
    else
        local log_message="Script $script_name started by Script Manager at $(date +'%Y-%m-%d %H:%M:%S') on behalf of user $username."
        echo "$log_message" >> "${ALL_SCRIPT_DIR}/${script_name}/${script_name}_output.log"
        
        echo -e "${BCyan}Starting Script${Color_Off} ${BRed}$script_name${Color_Off}"
        echo
        nohup "$script_path" >> "${ALL_SCRIPT_DIR}/${script_name}/${script_name}_output.log" 2>&1 &
        
        # Sleep for a short duration to allow the script to start
        sleep 1
        
        if is_script_running "$script_name"; then
            echo -e "${BGreen}Script${Color_Off} ${BRed}$script_name${Color_Off} ${BGreen}Started Successfully${Color_Off}"
            echo
        else
            echo -e "${BRed}Failed To Start Script ${Color_Off} ${BYellow}$script_name${Color_Off} ${BRed}. \nPlease Check Logs For Details.${Color_Off}"
            echo
        fi
    fi
}


# Function to terminate the script
terminate_script() {
    local script_name="$1"
    local log_message="Script $script_name terminated by Script Manager at $(date +'%Y-%m-%d %H:%M:%S') on behalf of user $username."

    # Get all process IDs associated with the script name and terminate them
    local pids=$(pgrep -f "$script_name")
    if [ -n "$pids" ]; then
        echo "$log_message" >> "${ALL_SCRIPT_DIR}/${script_name}/${script_name}_output.log"
        kill -TERM $pids
        
        local attempt=1
        local max_attempts=3  # You can adjust this value based on your needs

        # Loop to check if the processes are still running
        while [ $attempt -le $max_attempts ]; do
            sleep 1
            pids=$(pgrep -f "$script_name")

            if [ -z "$pids" ]; then
                echo -e "${BGreen}Terminating Script${Color_Off} ${BRed}$script_name${Color_Off} ${BGreen}Successful${Color_Off}"
                echo
                break
            else
                if [ $attempt -eq $max_attempts ]; then
                    echo -e "${BRed}Failed To Terminate Script${Color_Off} ${BYellow}$script_name${Color_Off}${BRed}. \nMaximum Attempts Reached.${Color_Off}"
                    echo
                    break
                else
                    echo -e "${BRed}Attempt $attempt : Script${Color_Off} ${BYellow}$script_name${Color_Off} ${BRed}Is Still Running.${Color_Off}"
                    echo
                    attempt=$((attempt + 1))
                fi
            fi
        done
    else
        echo -e "${BRed}Script ${Color_Off} ${BYellow}$script_name${Color_Off} ${BRed}Is Not Running.${Color_Off}"
        echo
    fi
}

restart_script() {
    local script_name="$1"
    local script_path="${ALL_SCRIPT_DIR}/${script_name}/${script_name}.sh"
    local log_message="Script $script_name restarted by Script Manager at $(date +'%Y-%m-%d %H:%M:%S') on behalf of user $username."

    # Get all process IDs associated with the script name and terminate them
    local pids=$(pgrep -f "$script_name")
    if [ -n "$pids" ]; then
        echo "$log_message" >> "${ALL_SCRIPT_DIR}/${script_name}/${script_name}_output.log"
        kill -TERM $pids

        local attempt=1
        local max_attempts=3  # You can adjust this value based on your needs

        # Loop to check if the processes are still running
        while [ $attempt -le $max_attempts ]; do
            sleep 1
            pids=$(pgrep -f "$script_name")

            if [ -z "$pids" ]; then
                echo -e "${BGreen}Terminating Script${Color_Off} ${BRed}$script_name${Color_Off} ${BGreen}Successful${Color_Off}"
                echo
                break
            else
                if [ $attempt -eq $max_attempts ]; then
                    echo -e "${BRed}Failed To Terminate Script${Color_Off} ${BYellow}$script_name${Color_Off}${BRed}. \nMaximum Attempts Reached.${Color_Off}"
                    echo
                    break
                else
                    echo -e "${BRed}Attempt $attempt : Script${Color_Off} ${BYellow}$script_name${Color_Off} ${BRed}Is Still Running.${Color_Off}"
                    echo
                    attempt=$((attempt + 1))
                fi
            fi
        done
    else
        echo -e "${BRed}Script ${Color_Off} ${BYellow}$script_name${Color_Off} ${BRed}Is Not Running.${Color_Off}"
        echo
    fi

    local log_message="Script $script_name started by Script Manager at $(date +'%Y-%m-%d %H:%M:%S') on behalf of user $username."
    echo "$log_message" >> "${ALL_SCRIPT_DIR}/${script_name}/${script_name}_output.log"

    echo -e "${BCyan}Starting Script${Color_Off} ${BRed}$script_name${Color_Off}"
    echo
    nohup "$script_path" >> "${ALL_SCRIPT_DIR}/${script_name}/${script_name}_output.log" 2>&1 &

    # Sleep for a short duration to allow the script to start
    sleep 1

    if is_script_running "$script_name"; then
        echo -e "${BGreen}Script${Color_Off} ${BRed}$script_name${Color_Off} ${BGreen}Restarted Successfully${Color_Off}"
        echo
    else
        echo -e "${BRed}Failed To Restart Script ${Color_Off} ${BYellow}$script_name${Color_Off} ${BRed}. \nPlease Check Logs For Details.${Color_Off}"
        echo
    fi
}



#-----------------------------------------------------Exit---------------------------------------------------------



echo
echo -e "${BCyan}************${Color_Off}${BYellow}[ ALL SCRIPT LIST ]${Color_Off}${BCyan}************${Color_Off}"
echo
get_script_list
echo 
echo -e "${BCyan}******************${Color_Off}${BYellow}[ END ]${Color_Off}${BCyan}******************${Color_Off}"
echo
echo

timeout_duration=60  # Timeout in seconds

while true; do
    ScriptMenu

    read -t $timeout_duration option || true
    echo
    
    if [[ -z "$option" ]]; then
        echo -e "${On_IRed}Timeout Reached. Script Is Exiting Due To Inactivity.${Color_Off}"
        echo
        break
    fi
    
    case $option in
        1)
            #-----------------------------------------------------StartScript------------------------------------------------------------
            echo -e "${BBlue}*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*${Color_Off}"
            echo -e "${BCyan}               START SCRIPT                ${Color_Off}"
            echo -e "${BBlue}*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*${Color_Off}"

            # Script List
            ScriptList


            read -p $'\e[1;36mEnter Your Choice :\e[0m ' start_choice
            echo

            case $start_choice in
                1)
                    start_script "MerchantOnBoard"
                    ;;
                2)
                    start_script "BillerOnBoardTracker"
                    ;;
                e)
                    echo -e "${BIPurple}[ Going Back to Main Menu ]${Color_Off}"
                    echo
                    continue
                    ;;
                *)
                    echo -e "${BRed}Invalid Choice.${Color_Off}"
                    echo
                    ;;
            esac
            
            
            echo -e "${BBlue}*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*${Color_Off}"
            echo -e "${BBlue}                   FINISH                  ${Color_Off}"
            echo -e "${BBlue}*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*${Color_Off}"
            echo
            ;;
            #----------------------------------------------------------Finish-----------------------------------------------------------

        2)
            #-----------------------------------------------------ByteSaverRestart------------------------------------------------------------
            echo -e "${BBlue}*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*${Color_Off}"
            echo -e "${BCyan}              TERMINATE SCRIPT             ${Color_Off}"
            echo -e "${BBlue}*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*${Color_Off}"
            
            #Script List
            ScriptList

            read -p $'\e[1;36mEnter Your Choice :\e[0m ' terminate_choice
            echo

            case $terminate_choice in
                1)
                    terminate_script "MerchantOnBoard"
                    ;;
                2)
                    terminate_script "BillerOnBoardTracker"
                    ;;
                e)
                    echo -e "${BIPurple}[ Going Back to Main Menu ]${Color_Off}"
                    echo
                    continue
                    ;;
                *)
                    echo -e "${BRed}Invalid Choice.${Color_Off}"
                    echo
                    ;;
            esac
            
            echo -e "${BBlue}*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*${Color_Off}"
            echo -e "${BBlue}                   FINISH                  ${Color_Off}"
            echo -e "${BBlue}*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*${Color_Off}"
            echo
            ;;
            #----------------------------------------------------------Finish-----------------------------------------------------------
        
        3)
            #-----------------------------------------------------ByteSaverRestart------------------------------------------------------------
            echo -e "${BBlue}*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*${Color_Off}"
            echo -e "${BCyan}              RESTART SCRIPT               ${Color_Off}"
            echo -e "${BBlue}*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*${Color_Off}"
            
            # Script List
            ScriptList

            read -p $'\e[1;36mEnter Your Choice :\e[0m ' restart_choice
            echo

            case $restart_choice in
                1)
                    restart_script "MerchantOnBoard"
                    ;;
                2)
                    restart_script "BillerOnBoardTracker"
                    ;;
                e)
                    echo -e "${BIPurple}[ Going Back to Main Menu ]${Color_Off}"
                    echo
                    continue
                    ;;
                *)
                    echo -e "${BRed}Invalid Choice.${Color_Off}"
                    echo
                    ;;
            esac
            
            echo -e "${BBlue}*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*${Color_Off}"
            echo -e "${BBlue}                   FINISH                  ${Color_Off}"
            echo -e "${BBlue}*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*${Color_Off}"
            echo
            ;;
        #----------------------------------------------------------Finish-----------------------------------------------------------

        PC)
            #-----------------------------------------------------ByteSaverRestart------------------------------------------------------------
            echo -e "${BBlue}*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*${Color_Off}"
            echo -e "${BCyan}              PROCESS CHECK                ${Color_Off}"
            echo -e "${BBlue}*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*${Color_Off}"
            
            #Script List
            ScriptList

            read -p $'\e[1;36mEnter Your Choice :\e[0m ' pc_choice
            echo

            case $pc_choice in
                1)
                    script_name="MerchantOnBoard"
                    ;;
                2)
                    script_name="BillerOnBoardTracker"
                    ;;
                e)
                    echo -e "${BIPurple}[ Going Back to Main Menu ]${Color_Off}"
                    echo
                    continue
                ;;
                *)
                    echo -e "${BRed}Invalid Choice.${Color_Off}"
                    echo
                    return
                    ;;
            esac

            if is_script_running "$script_name"; then
                echo -e "${BGreen}Script${Color_Off} ${BRed}$script_name${Color_Off} ${BGreen}Is Currently Running.${Color_Off}"
                echo
            else
                echo -e "${BRed}Script${Color_Off} ${BYellow}$script_name${Color_Off} ${BRed}Is Not Running.${Color_Off}"
                echo
            fi
            
            echo -e "${BBlue}*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*${Color_Off}"
            echo -e "${BBlue}                   FINISH                  ${Color_Off}"
            echo -e "${BBlue}*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*${Color_Off}"
            echo
            ;;
            #----------------------------------------------------------Finish-----------------------------------------------------------
        e)
            #-----------------------------------------------------------------------------------------------------------------
            echo -e "*${BRed}----* THANKS FOR USING THIS SCRIPT *-----${Color_Off}*"
            echo
            echo -e "*${BRed}------------------${Color_Off}${BYellow}EXIT${Color_Off}${BRed}-------------------${Color_Off}*"
            echo
            break
            ;;
            #-----------------------------------------------------------------------------------------------------------------
        T)
            #-----------------------------------------------------Developer-Test-Option------------------------------------------------------------
            echo -e "${BBlue}*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*${Color_Off}"
            echo -e "${BRed}                  [ DEVELOPER TEST OPTION ]                 ${Color_Off}"
            echo -e "${BBlue}*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*${Color_Off}"
            echo
            echo -e "${URed}Developer Test Option.${Color_Off}"
            echo
            echo -e "${BBlue}*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*${Color_Off}"
            echo -e "${BRed}                         [ FINISH ]                         ${Color_Off}"
            echo -e "${BBlue}*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*${Color_Off}"
            echo
            ;;
            #--------------------------------------------------------------Exit---------------------------------------------------
        *)
            echo -e "${BRed}Please Enter Valid Serial NO.${Color_Off}"
            echo
            ;;
    esac
    echo
done
    # Capture the exact exit time of the script
    exit_time=$(date +'%Y-%m-%d %H:%M:%S')

    # Append login information to the file
    append_login_info "$username" "$login_time" "$exit_time"

    # Send login alert to Telegram
    send_logout_alert "$username" "$login_time" "$exit_time"