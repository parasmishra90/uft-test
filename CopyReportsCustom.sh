#!/bin/sh

basePath="C:\\testnow"
ruby $basePath/code/genreport.rb


source "$basePath/jobparams.sh"
mkdir "${basePath}/code/${OUTPUT_DIR}"


#Init Run Count
runCount=`cat $basePath/RunCount.txt`
export RUN_COUNT=$runCount

cd $basePath
sh copyReportsAndNotifyTestNow.sh

nohup sudo sh #{basePath}/cleanup.sh &
echo "Automation test execution done............................................................."