#! /bin/bash

# cat all files starting with 03 and wildcard search the rest
# awk to isolate TIME ($1), MERIDIEM ($2), ROULETTE DEALERS FIRSTNAME ($5), LASTNAME ($6)
# grep to grab only the specific times gathered from Player_Analysis, save contents into Dealers_working_during_losses file
cat 03* | awk -F" " '{print $1, $2, $5, $6}' | grep -E '05.*AM|08.*AM|02.*PM|08.*PM|11.*PM' > Dealers_working_during_losses

# echo file contents Dealers_working_during_losses, alternative - cat or printf
echo "$(<Dealers_working_during_losses)"
