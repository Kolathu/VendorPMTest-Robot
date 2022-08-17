*** Settings ***
Documentation     All the page objects and keywords of Dashboard page
Library           SeleniumLibrary
Resource        Generic.robot



*** Variables ***
${Home_link}             xpath:(//p[normalize-space()='Home'])
${Quote_link}      xpath:(//p[normalize-space()='Quote Requests'])
${Inbox_link}      xpath:(//p[normalize-space()='Inbox'])
${Listing_link}      xpath:(//p[normalize-space()='My Listing'])
${logout_menu}        xpath:(//p[normalize-space()='testvendor comp'])
${logout}        xpath:(//span[normalize-space()='Logout'])
${Compliance}        xpath:(//p[normalize-space()='Compliance'])




*** Keywords ***

Verify page contents on Vendor Dashboard
    Wait Until Page Contains Element  ${Home_link}
    Wait Until Page Contains Element  ${Quote_link}
    Wait Until Page Contains Element  ${Inbox_link}
    #Page Should Not Contain Element  ${frequency}
    Wait Until Page Contains Element  ${Listing_link}
    Wait Until Page Contains Element  ${logout_menu}
    Wait Until Page Contains Element  ${Compliance}

Logout as Vendor

   Wait Until Page Contains Element  ${logout_menu}
   Click Element   ${logout_menu}
   Wait Until Page Contains Element   ${logout}
   Click Element   ${logout}
   Set Selenium Implicit Wait  5

