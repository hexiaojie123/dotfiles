#!/bin/bash

ID="$1"
RESULT="$2"
GROUP="$3"
START="$4"
END="$5"
PATH_DIR="$6"
COMMAND="$7"
EXIT_CODE="$8"

B="\033[1m"       # Bold
N="\033[0m"       # Reset
C_GREEN="\033[0;32m"
C_RED="\033[0;31m"
C_BLUE="\033[0;34m"
C_YELLOW="\033[0;33m"
C_GREY="\033[90m"

if [ "$RESULT" == "Success" ]; then 
    SC=$C_GREEN
else 
    SC=$C_RED
fi

get_day() {
    local epoch="$1"
    local fmt="$2"
    if [[ "$(uname)" == "Darwin" ]]; then
        date -r "$epoch" "+$fmt"
    else
        date -d "@$epoch" "+$fmt"
    fi
}

D1=$(get_day "$START" "+%F")
D2=$(get_day "$END" "+%F")
ST=$(get_day "$START" "+%Y-%m-%d %H:%M:%S")

DIFF=$(( END - START ))
H=$((DIFF / 3600))
M=$(( (DIFF % 3600) / 60 ))
S=$((DIFF % 60))
TOTAL=$(printf "%02d:%02d:%02d" $H $M $S)

if [ "$D1" == "$D2" ]; then
    ET=$(get_day "$END" "+%H:%M:%S")
else
    ET=$(get_day "$END" "+%Y-%m-%d %H:%M:%S")
fi

if [ ${#COMMAND} -gt 100 ]; then COMMAND="${COMMAND:0:80}..."; fi
if [ ${#PATH_DIR} -gt 100 ]; then 
    TAIL_PATH="${PATH_DIR: -80}"
    PATH_DIR="...${TAIL_PATH}"
fi

clear
printf "\n   ${B}${SC}Task #${ID} Finished${N} \n"

printf "${C_GREY} ------------------------------------------------------------ ${N}\n"

printf "   ${B}Status:${N}    ${SC}${RESULT}${N} ${C_GREY}(Exit: ${EXIT_CODE})${N}\n"
printf "   ${B}Group:${N}     ${C_BLUE}${GROUP}${N}\n"
printf "   ${B}Time:${N}      ${C_YELLOW}$ST${N}  ➔  ${C_YELLOW}$ET${N}\n"
printf "   ${B}Duration:${N}  ${C_YELLOW}${TOTAL}${N}\n"
printf "   ${B}Path:${N}      ${C_BLUE}${PATH_DIR}${N}\n"
printf "   ${B}Command:${N}   ${COMMAND}\n"

printf "${C_GREY} ------------------------------------------------------------ ${N}\n"
printf "   ${B}[Log Snippet - Last 30 Lines]:${N} \n\n"

if command -v bat &> /dev/null; then
    pueue log "$ID" 2>&1 | awk "/output:/ {flag=1; next} flag" | tail -n 30 | \
        bat --style=plain --paging=never --language=log --color=always
else
    pueue log "$ID" 2>&1 | awk "/output:/ {flag=1; next} flag" | tail -n 30
fi

printf "\n${C_GREY} ---------------------------------------------------------- ${N}\n"

printf " ${C_GREY}[Press any key to close]${N} "
read -n 1 -s -r < /dev/tty

zellij action toggle-floating-panes
