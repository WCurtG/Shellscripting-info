#!/bin/bash


# This is the variable string we will be working with 
var="apple orange"

# Use # to delete from the beginning of the string in restricted mode 
echo "Demo of the single #"
echo "${var#a}"
echo "----------"

# Use ## to delete from the beginning of the string in open mode  
echo "Demo of the double # or ##"
echo "${var##*l}"
echo "${var##*r}"
echo "----------"

# Use % to delete from the end of the string in restricted mode  
echo "Demo of the single %"
echo "${var%g*}"
echo "${var%l*}"
echo "----------"

# Use %% to delete from the end of the string in open mode by starting at the end and finding the space and deleting character after it (* indicates any character)
echo "Demo of the double % or %%"
echo "${var%% *}"
echo "----------"

# Use ## to delete from the beginning of the string in open mode by starting at the end and finding the space and deleting character before it (* indicates any character)
echo "Demo of the double # or ##"
echo "${var##* }"
echo "----------"