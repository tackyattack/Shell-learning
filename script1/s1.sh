#!/bin/sh
# This is a comment

echo "shell script running..."

MY_MESSAGE="Variable assignment: There shouldn't be a space between the variable, equal sign, and the value."
echo $MY_MESSAGE

echo "Now, enter your name, Human."
read HUMAN_NAME
echo "Hello, $HUMAN_NAME. Welcome to my first script."

echo "Please enter a name for a text file:"
read TEXT_FILE_NAME
touch ${TEXT_FILE_NAME}.txt
echo "File created."

echo "Now I am going to write 1-6 in the file."
for i in 1 2 3 4 5 6
do
 echo "$i" >> ${TEXT_FILE_NAME}.txt
done
