#!/bin/bash

# This is the opposite of `&&`  also referred to as “or or” 

cat doesntexit.txt || echo "your file doesn't exist"