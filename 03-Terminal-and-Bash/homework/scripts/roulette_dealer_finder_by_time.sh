#!/bin/bash

# grep $2 for time, $3 for AM/PM and $1 for date
# run syntax ./roulette_dealer_finder_by_time.sh MONTHDAY TIME AM/PM
grep -E "$2.*$3" $1_Dealer_schedule | awk -F" " '{print $1, $2, $5, $6}'
