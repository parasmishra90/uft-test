ES_IP=""
BROWSER="IE"
VERSION="11"
CODE_PATH='c:'
REPORT_FILE= "run_results.xml"
OUTPUT_DIR="Reports"
require 'rexml/document'
include REXML


require 'json'
require 'c:\testnow/pushJsonToES'
dataArray = JSON.parse("[]")
file = File.read("#{CODE_PATH}/#{OUTPUT_DIR}/#{REPORT_FILE}")
xmldoc = Document.new File.new("#{CODE_PATH}/#{OUTPUT_DIR}/run_results.xml") 
# Document.new(file)

 # Now get the root element
 root = xmldoc.root
 


 xmldoc.elements.each("/Results/ReportNode/ReportNode/ReportNode/Data"){
   |e| puts "Test Name : " + e.elements["Name"].text
       name = e.elements["Name"].text
       scenario_data = JSON.parse('{}')
       scenario_data['name'] = e.elements["Name"].text
       # scenario_data['duration'] =  '0'
       status = e.elements["Result"].text
       puts status
       if status == "Done"
        status = "passed"
       else
        status = "failed"
       end
       scenario_data['status'] = status
       dataArray.push(scenario_data)
 }
 
pushJson(dataArray, "testnow_test_data")