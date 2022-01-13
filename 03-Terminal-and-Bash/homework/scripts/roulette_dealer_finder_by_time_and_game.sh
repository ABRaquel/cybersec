#! /bin/bash

# cat with DATE argument ($1)
# awk by isolationing TIME ($1), MERIDIEM ($2), with passing argument $3 and $4 -- refer to $3/$4 Blackjack | $5/$6 Roulette | $7/$8 Texas Hold em
# grep by TIME $2
# run sytax ./roulette_dealer_finder_by_time_and_game.sh MONTHDAY 'XX:XX:XX MERIDIEM' '$3' '$4' << change passing argument '$X' for each game
cat $1_Dealer_schedule | awk -F" " '{print $1, $2, '$3' , '$4' }' | grep "$2"
