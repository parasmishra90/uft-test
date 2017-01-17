#UFT URL TEST Steps from command Prompt 

Step1 - Clone the given repository in your local machine or instance or Pass the Git Master Repository URL in VerifyNow.

GIT Repo Name - https://github.com/reancloud/urltest-uft

Step2 - Make sure you have installed following software in your Instance or local Machine.

   A - HP UFT12.x

   B - Python2.x    Note : Make sure these two are installed in System(Windows-Path)

Step3 - Set the environment variable from command prompt.

A- Go to Run

B- Type Powershell.exe

C- Power Shell  will be open.

D- write this    C:\users>$env: TEXT_TO_SEARCH = "Rean"       press Enter

E- C:\users>$env: TEST_URL = "http://www.reancloud.com"       press Enter

Note : Make sure you didn't get any error while pressed enter.

Step4 - Go to power shell again and run below command. ( Make sure you have setup Environment variable and run vbs file on same shell only)

PS C:\> Cscript "< Path of RunURLTest.vbs script where you have cloned from GIT >"  "< Path of UFT test case folder >"    Press Enter


This will do following task.

A- Set the Report folder <"C:/users"> , where the reports will be generates.

B- Run the UFT test case from command prompt , this will use environment variable that we have passed in @step3.

C- Wait until UFT complete the test case , then it will start a Python converter file from command prompt that will convert reports from XML to Json.
