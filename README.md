# Disconnect Bluetooth Devices On Sleep
Tired of your bluetooth headphones pairing with a MacOs computer you thought was asleep ? This fixes that

This repo is a fork of https://github.com/alb12-la/KBOS but instead of disabling bluetooth, it disconnects specific devices instead.

KBOS uses `sleepwatcher` and `Blueutil` to turn off bluetooth when your mac falls asleep, then turns it back on when the computer is woken up.

## Prerequisites
KBOS requires [Homebrew](https://brew.sh/) which is used to install the following packages:
 * [Blueutil](https://formulae.brew.sh/formula/blueutil#default)
 * [sleepwatcher](https://formulae.brew.sh/formula/sleepwatcher#default)

## Installation
 1. Install [Homebrew](https://brew.sh/) manually first.
 2. Find your device's MAC address: `$ blueutil --paired`
 3. Edit `connect.sh` and `disconnect.sh` and add your device's address
 4. Run `./setup.sh` from this directory.


## Future improvements
- Attempt to connect to last connected device on wake.
- Improve script output and robustness


## Report a bug
If this script doesn't work for you, please let me know so I can improve it or feel free to send a pull request.
