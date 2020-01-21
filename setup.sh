#!/bin/bash

echo "***************************"
echo "Checking for prerequisites"
echo "***************************"

if [[ $(which brew) == "" ]]; then
    echo "Could not find Hombrew, It's required to install Blueutil. Check it out https://brew.sh/"
    exit 1
else
    echo "** Homebrew OK"
fi

# Check for blueutil
if [[ $(which blueutil) == "" ]]; then
    echo "Could not find blueutil, Installing ..."
    brew install blueutil || exit 1
else
    echo "** Blueutil OK"
fi

# Check for sleepwatcher

if [[ $(which sleepwatcher) == "" ]]; then
    echo "Could not find sleepwatcher, Installing ..."
    brew install sleepwatcher || exit 1
    brew services start sleepwatcher || exit 1
else
    echo "** sleepwatcher OK"
fi

echo "***********************"
echo "Preparing sleep scripts"
echo "***********************"

# Copy sleepscripts to user directory
mkdir -p ~/.sleepscripts || exit 1;
cp ./disconnect.sh ~/.sleepscripts
cp ./connect.sh ~/.sleepscripts
chmod +x ~/.sleepscripts/** || exit 1;
echo "** sleep scripts copied to ~/.sleepscripts"

# Copy plist to ~/Library/LaunchAgents
cp ./sleepwatch_bluetooth.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/sleepwatch_bluetooth.plist
echo "** sleepwatch_bluetooth.plist copied to ~/Library/LaunchAgents"

echo "Auto-connect has been successfully installed"