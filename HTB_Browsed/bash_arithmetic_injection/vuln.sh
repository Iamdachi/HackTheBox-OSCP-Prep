#!/bin/bash

# -eq operator is vulnerable to injection + command execution
NUM="$1"
if [[ "$NUM" -eq 100 ]];then
  echo "OK"
else
  echo "NG"
fi

