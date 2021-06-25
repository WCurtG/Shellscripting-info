#!/bin/bash

# && let’s you string together 2 commands but will only run the second command if the first is successful 

cat doesntexit.txt && echo "your file exist"