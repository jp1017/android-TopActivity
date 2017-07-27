#!/bin/sh

#显示当前应用包名及Activity

oldActvity=""
displayName=""
currentActivity=`adb shell dumpsys window windows | grep -E 'mCurrentFocus'`
while true
do
	if [[ $oldActvity != $currentActivity && $currentActivity != *"=null"* ]]; then
		displayName=${currentActivity##* }
		displayName=${displayName%%\}*}
		echo $displayName
		oldActvity=$currentActivity
	fi
	currentActivity=`adb shell dumpsys window windows | grep -E 'mCurrentFocus'`
done

