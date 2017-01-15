import json
import xmltodict
import sys
import os
 
def convert(xml_file, xml_attribs=True):
    with open(xml_file, "r") as f:    # notice the "rb" mode
        d = xmltodict.parse(f, xml_attribs=xml_attribs)
        sys.stdout = open('report\index.json',"w")
        print (json.dumps(d, indent=4)) 
        sys.stdout.close()
os.mkdir('report')
convert('C:\\Report\\run_results.xml')