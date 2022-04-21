#!/bin/sh
set -e

DIFF_FROM_PROD=$(git rev-list --left-right --count HEAD...origin/prod|awk '{print $2}')

echo "----------------------------------------------------------------------------------------------------"
echo "| PROD BRANCH CHECKER                                                                             |"
echo "----------------------------------------------------------------------------------------------------"

if [ "$DIFF_FROM_PROD" -gt "0" ]; then
    echo "| Your build has failed because prod has $DIFF_FROM_PROD more changes than your current branch |"
    echo "|                                                                                                  |"
    echo "| You need to run 'git pull origin prod' on your branch!                                         |"
    echo "----------------------------------------------------------------------------------------------------"
    exit 1
else
    echo "| Your build is up to date with prod well done!                                                   |"
    echo "----------------------------------------------------------------------------------------------------"
    exit 0
fi
