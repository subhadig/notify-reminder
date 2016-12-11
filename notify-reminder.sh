#!/bin/bash

#########################################################
# Copyright (C) 2016 Subhadip Ghosh			#
#							#
# This reads the file passed as the first argument and 	#
# sends the parsed lines as a collated notification via	#
# notify-osd.						#
#							#
# Usage: ./notify-reminder.sh <reminder file path>	#
#							#
# Note: If a line in a reminder file starts with #, the	#
# line is ignored.					#
#########################################################


reminderFile=$1

while read line
do
	if case ${line} in \#*) false;; *) true;; esac;
	then
		message=${message}"\n"${line}
	fi
done<"${reminderFile}"

/usr/bin/notify-send Reminders "${message}"
