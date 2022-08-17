*** Settings ***
Documentation     All the page objects and keywords of Dashboard page
Library           SeleniumLibrary
Resource        Generic.robot



*** Variables ***
${Quote_Header}             xpath:(//h2[contains(@class,'undefined')])
${Quote_link}      xpath:(//p[normalize-space()='Quote Requests'])
${Search_box}      xpath:(//input[@placeholder='Search...'])
${Listing_link}      xpath:(//p[normalize-space()='My Listing'])
${RFQ_select}        xpath:(/html[1]/body[1]/div[2]/section[1]/section[1]/section[1]/main[1]/div[3]/div[1]/div[2]/div[2]/div[1]/div[4]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/table[1]/tbody[1]/tr[1]/td[3])
${Decline}        xpath:(//button[normalize-space()='Decline'])
${Accept}        xpath:(//button[normalize-space()='Accept'])
${job_location}   xpath:(//input[@value='jobLocation'])
${outofservice}   xpath:(//input[@value='outOfServiceArea'])
${diffcuiltaccess}   xpath:(//input[@value='difficultToAccess']




*** Keywords ***

Verify page contents on Vendor Dashboard
    Click Element   ${Quote_link}
    Wait Until Page Contains Element  ${Quote_Header}
    Wait Until Page Contains Element  ${Search_box}
    #Wait Until Page Contains Element  ${Inbox_link}
    #Page Should Not Contain Element  ${frequency}
    #Wait Until Page Contains Element  ${Listing_link}
    #Wait Until Page Contains Element  ${logout_menu}
    #Wait Until Page Contains Element  ${Compliance}

Select the RFQ to accept work

   Input Text   ${Search_box}    test the unique
   Click Element  xpath:(//input[contains(@value,'archived')])
   Wait until page contains Element  ${RFQ_select}
   Click Element  ${RFQ_select}

Verify decline and accept works

   Wait until page contains element  ${Decline}
   Wait until page contains element  ${Accept}
   Click Element  ${Decline}
   Set Selenium Implicit Wait  5
   Wait until page contains element   ${job_location}
   click element   ${job_location}




