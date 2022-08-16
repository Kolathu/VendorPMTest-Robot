*** Settings ***
Documentation     All the page objects and keywords of landing page
Library           SeleniumLibrary
Resource        Generic.robot


*** Variables ***
${Error_Message_Login}      xpath:(//div[@role='alert'])

*** Keywords ***

Fill the login Form
    [arguments]     ${username}     ${password}
    Input Text          xpath:(//input[@id='basic_email'])     ${username}
    Input Password      xpath:(//input[@id='basic_password'])     ${password}
    Click Button        xpath:(//button[@type='submit'])

wait until Element is located in the page
    Wait Until Page Contains Element     ${Error_Message_Login}


verify error message is correct
   ${result}=   Get Text    ${Error_Message_Login}
   Should Be Equal As Strings     ${result}     Incorrect email or password. Reset your password?
   Element Text Should Be       ${Error_Message_Login}      Incorrect email or password. Reset your password?


#Fill the Login Details and Login Form

 #   Input Text          id:username     rahulshettyacademy
 #   Input Password      id:password     learning
 #   Click Element       css:input[value='user']
 #   Wait Until Element Is Visible       css:.modal-body
 #   Click Button        id:okayBtn
 #  Click Button        id:okayBtn
 #  Wait Until Element Is Not Visible   css:.modal-body
 #  Select From List By Value       css:select.form-control       teach
 #  Select Checkbox     terms
 #  Checkbox Should Be Selected     terms
