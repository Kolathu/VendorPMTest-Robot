*** Settings ***
Documentation     All the page objects and keywords of Dashboard page
Library           SeleniumLibrary
Resource        Generic.robot


*** Variables ***
${Create_quote_Request}       xpath:(//button[normalize-space()='Create Quote Request'])

*** Keywords ***



wait until Element is located in the page
    Maximize Browser Window
    Wait Until Page Contains Element     ${Create_quote_Request}

Click on Create RFQ
    Click Button   ${Create_quote_Request}





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
