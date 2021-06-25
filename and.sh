#!/bin/bash

# This is totally different than `&&` because it doesn’t wait for the first command to finish running, it runs them in order but right away. 

sleep 5 & echo "All done." 