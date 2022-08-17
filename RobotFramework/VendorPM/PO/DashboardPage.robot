*** Settings ***
Documentation     All the page objects and keywords of Dashboard page
Library           SeleniumLibrary
Resource        Generic.robot


*** Variables ***
${Valid_Message_Login_PM}      xpath:(//section[@id='pm-dashboard']//div//div//div//h1)
${Valid_Message_Login_Vendor}      xpath:(//body/div/section/section/section/main/div/div/div/h1[1])

*** Keywords ***



wait until Element is located in the page

    Wait Until Page Contains Element     ${Valid_Message_Login_PM}

wait until Element is located in the page Vendor

    Wait Until Page Contains Element     ${Valid_Message_Login_Vendor}





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
