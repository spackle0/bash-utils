#!/bin/bash
# Find files above a certain size in the current directory
# and its subdirectories
find . -type f -size +100m -exec ls -lh {} \; | \
  awk '{ print $9 ": " $5 }'