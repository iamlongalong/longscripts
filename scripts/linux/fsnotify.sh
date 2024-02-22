#!/bin/bash

source ../../lib/loglib.sh
# logmsg(args...)

# Check the current value of fs.inotify.max_user_watches
current_value=$(sysctl fs.inotify.max_user_watches | awk '{ print $3 }')

# Compare the current value with the threshold
if [ "$current_value" -lt 10000 ]; then
    # If the current value is less than 10000, set it to 524288
    sudo sysctl -w fs.inotify.max_user_watches=524288
    logmsg "fs.inotify.max_user_watches was less than 10000. It has been set to 524288."
else
    logmsg "fs.inotify.max_user_watches is already set to a value greater than or equal to 10000. Current value: $current_value"
fi
