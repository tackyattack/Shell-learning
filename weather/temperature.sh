#!/bin/sh
# This script gets the temperature of a zipcode
# Regex tester: https://www.regextester.com/96872
# Cheat sheet: http://www.rexegg.com/regex-quickstart.html
echo "Enter the zipcode of where you wish to know the temperature:"
read ZIP
WEATHER_URL="https://www.wunderground.com/weather/us/$ZIP"
search_content=$(wget --user-agent=Chrome $WEATHER_URL -q -O -)
# You have to use E for extended regex
ERR_CHECK=$(echo $search_content | grep -oE ".*")
TEMPERATURE=$(echo $search_content | grep -oE "=\"current\-temp\".*?wu\-value wu\-value\-to\".*?>..")
TEMPERATURE=$(echo $TEMPERATURE | grep -oE "..$")
if [ "$TEMPERATURE" = "" ]
then
  echo "There was an error. Wrong zipcode?"
else
  echo "Hello! The temperature in your area is $TEMPERATURE degrees Fahrenheit."
fi
