#!/bin/sh

ruby genreport.rb
basePath="C:\\testnow"
source "$basePath/jobparams.sh"
mkdir "${basePath}/code/${OUTPUT_DIR}"

while [ ! -f "$basePath/dummy.txt" ]
do
  echo "Sleeping for 5 seconds....." >> "c:\\TestNow/sleep.txt"
  sleep 5
done

#Init Run Count
runCount=`cat $basePath/RunCount.txt`
export RUN_COUNT=$runCount

cd $basePath
sh copyReportsAndNotifyTestNow.sh

nohup sudo sh #{basePath}/cleanup.sh &
echo "Automation test execution done............................................................."

cmd