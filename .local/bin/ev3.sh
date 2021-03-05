#!/bin/sh
#
# Directory where the ev3rt repo has been cloned to
EV3RT_DIR="/home/$USER/Documents/projects/"
# Path between ees20/ and the folder with the app. Can be left empty
APPPATH="/ev3rt-hrp2/sdk/workspace/" # Has to end on a slash if not empty, cannot start with one
# Name of the folder (will also be used as app name on the ev3)
APPNAME="Robotic_app" # no slash in front
# UUID of the ev3
EV_BT_UUID="\"FD91-9997\""
if [[ $(sudo blkid | grep "$EV_BT_UUID") ]]; then
	Device=$(sudo blkid | grep "$EV_BT_UUID" | sed "s/:.*//")
else
	echo "No EV3 found"
	exit 1
fi

if [[ $(df -h | grep "$Device") ]]; then
	echo "Device already mounted, skipping mount process"
	DIR="$(df -h | grep "$Device" | sed "s/.*%\ //")/"
else
	echo "Device not mounted, looking for folder to mount on"
	DIR="/mnt/ev3/"
	if [[ -d "$DIR" ]]; then
		echo "Found folder to mount on"
	else
		echo "Folder not found, creating /mnt/ev3/"
		cd /mnt
		sudo mkdir ev3 
	fi
	sudo mount "$Device" /mnt/ev3 || { echo 'Mounting failed' ; exit 2; }
fi
cd "$EV3RT_DIR"/ev3rt-hrp2/sdk/workspace
echo "Making app"
make app=./ees20/"$APPPATH""$APPNAME"
if [ $? -eq 0 ]; then
	echo "Copying app to ev3"
	sudo cp app "$DIR"ev3rt/apps/"$APPNAME"
	EX_CODE=0
else
	echo "Make failed, aborting"
	EX_CODE=3
fi
if [ "$DIR" == "/mnt/ev3/" ]; then
	echo "Unmounting EV3"
	sudo umount "$DIR"
fi
exit "$EX_CODE"
