# Default the TZ environment variable to UTC.
TZ=${TZ:-UTC}
export TZ

echo "Hi! :D"
echo "> Egg by Meegie"

# Set environment variable that holds the Internal Docker IP
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Switch to the container's working directory
cd /home/container || exit 1

echo Main dir exists

# Print Node.js version
# printf "\033[1m\033[33mcontainer@Meegie~ \033[0mnode -v\n"
node -v
echo Nodejs version

# Convert all of the "{{VARIABLE}}" parts of the command into the expected shell
# variable format of "${VARIABLE}" before evaluating the string and automatically
# replacing the values.
PARSED=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g' | eval echo "$(cat -)")

echo Transformed variables

# Display the command we're running in the output, and then execute it with the env
# from the container itself.

echo Running...

printf "\033[1m\033[33mcontainer@Meegie~ \033[0m%s\n" "$PARSED"
# shellcheck disable=SC2086
exec env ${PARSED}

echo Run done!