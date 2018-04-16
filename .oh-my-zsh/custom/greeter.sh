#!/bin/bash

# Greet user according to the current time

hour=$(date +"%H")
name=$(tr '[:lower:]' '[:upper:]' <<< ${USER:0:1})${USER:1}

if [ $hour -ge 0 -a $hour -lt 12 ]
then
    text="Good morning $name."
elif [ $hour -ge 12 -a $hour -lt 18 ]
then
    text="Good afternoon, $name."
else
    text="Good evening, $name."
fi

echo $text

