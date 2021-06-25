#!/bin/bash

# Use # to delete from the beginning of the string 

var="apple orange"
echo "${var#a}"
echo "----------"

# This command will print delete 'or' and everything before it. Using # is restricted, using ## is more open and grabs it all  

echo "${var#*or}"
echo "${var#*p}"
echo "${var##*p}"
echo "----------"

# This command will print delete 'or' and everything from the end. Using % is restricted, using %% is more open and grabs it all  

echo "${var%e*}"
echo "${var%p*}"
echo "${var%%p*}"
echo "----------"

# This command will print 'apple'

echo "${var%% *}"
echo "----------"

# This command will print 'orange'

echo "${var##* }"
echo "----------"