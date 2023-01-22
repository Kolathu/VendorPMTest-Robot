*** Settings ***

Documentation   To validate the login page
Library     SeleniumLibrary
#Resource

*** Test Cases ***
Validate login page
           open the browser with stage url
           validate page contents

*** Keywords ***
open the browser with stage url
     ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    no-sandbox
    Call Method    ${chrome_options}   add_argument    disable-dev-shm-usage
    ${options}=     Call Method     ${chrome_options}    to_capabilities

    Open Browser  https://stage.vendorpm.com/login   browser=chrome  desired_capabilities=${options}
   // Create Webdriver    Chrome  executable_path=C:/Users/kolat/Documents/chromedriver_win32/chromedriver.exe
    //Go to   https://stage.vendorpm.com/login

validate page contents
     Page Should contain button     xpath=//button[@type='submit']
     Element Text Should be     xpath=//label[@title='Email Address']   Email Address
     Element Text Should be     xpath=//label[@title='Password']   Password
     Page Should Contain Element    xpath=//body/div[@id='root']/section[@id='landing-layout']/main/div[@id='login']/div[@id='login-col']/div/div[1]/div[2]
     Page Should Contain Checkbox   xpath=//input[@type='checkbox']
     Page Should Contain Element   xpath=//a[@href='/signup']//span
     Click Element   xpath=//a[@href='/signup']//span
     #Go back
