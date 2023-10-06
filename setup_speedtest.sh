#!/bin/bash

# attempt to install speedtest-cli
echo "Installing necessary rerequisite packages, this may take a minute"
brew install speedtest-cli

# Define the directory where the scripts and .plist file are located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Define the destination paths
PLIST_DEST="/Library/LaunchDaemons/speed_test.plist"
SCRIPT_DEST="/usr/local/bin/speed_test.sh"

# Ensure the script is executable
chmod +x "$SCRIPT_DIR/speed_test.sh"

# Modify the .plist file to use the correct path for speed_test.sh
sed -i '' "s|/Users/harrisonward/Desktop/CS/local_projects/speedtest/speed_test.sh|$SCRIPT_DEST|" "$SCRIPT_DIR/speed_test.plist"

# Move the files to the appropriate locations (might require sudo)
sudo mv "$SCRIPT_DIR/speed_test.plist" "$PLIST_DEST"
sudo mv "$SCRIPT_DIR/speed_test.sh" "$SCRIPT_DEST"

# Set the correct ownership and permissions for the .plist file
sudo chown root:wheel "$PLIST_DEST"
sudo chmod 644 "$PLIST_DEST"

# Load the job (might require sudo)
sudo launchctl load "$PLIST_DEST"

# Provide feedback to the user
echo "Setup complete! The speed_test job should now be scheduled on your system."