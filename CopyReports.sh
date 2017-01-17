#!/bin/sh

mainDir="c:\\testnow"
cd $mainDir/code
ruby genreport.rb

cd $mainDir
source CopyReports.sh