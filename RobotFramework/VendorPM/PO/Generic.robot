*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary


*** Variables ***
${user_name_PM}             testpmenttdel@test.com
${user_name_Vendor}             testvendorcomp@test.com
${invalid_password}      123445
${valid_password}        abc123
${url}                   https://qa.vendorpm.com/login
${browser_name}          Chrome




*** Keywords ***

open the browser with the Stage url
    Create Webdriver    Chrome  executable_path=C:/Users/kolat/PycharmProjects/RobotFramework/VendorPM/Browser/chromedriver_win32/chromedriver.exe
    Go To   ${url}

open the browser with the url
    Create Webdriver    ${browser_name}  executable_path=resources/${browser_name}
    Go To   ${url}

Close Browser session
    Close Browser

#Wait Until element passed is located on Page
 #   [arguments]         ${page_locator}
  #  Wait Until Element Is Visible        ${page_locator}        timeout=10
