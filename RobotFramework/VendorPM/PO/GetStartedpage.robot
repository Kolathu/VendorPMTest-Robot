*** Settings ***
Documentation     All the page objects and keywords of Dashboard page
Library           SeleniumLibrary
Resource        Generic.robot



*** Variables ***
${Title}             xpath:(//input[@id='title'])
${Title_Filled}      xpath:(//input[@placeholder='E.g., Spring window cleaning'])
${Properties}      xpath:(//input[@id='properties'])
${Propertiestoadd}      xpath:((//div)[100])
${Services_needed}        xpath:(//input[@placeholder='Start typing to search...'])
${Budget}                   xpath:(//input[@id='budget'])
${Next_ImportantDates}          xpath:(//button[contains(@class,'button_primary__M6ILH footer_nextBtn__mNQMl')])
${Previous_GetStarted}     xpath:(//body/div[@id='root']/section[@id='app-layout']/section/section/main[@id='app-layout-content']/div/div/div/button[1])
${Vendor_logo}      xpath:(//div[@class='vendorpm-logo']//*[name()='svg'])
${Leave_Header}   xpath:(//h1[contains(@class,'modal_title__wyikF')])
${Leave_Message}   xpath:(//p[contains(text(),'You can always continue building this Quote Reques')])
${Stay_button}   xpath:(//button[normalize-space()='No, stay here'])
${Create_draft_button}   xpath:(//button[normalize-space()='Yes, save and exit'])


*** Keywords ***



Fill the form

    Input Text          ${Title}       Important Dates Step (One time)
    Click Element        ${Properties}
    Input Text            ${Properties}    these
    Press Keys             ${Properties}                ENTER
    Click Element        ${Title}
    Click Element      ${Services_needed}
    Input Text            ${Services_needed}   Air Purification
    Press Keys             ${Services_needed}                ENTER
    Click Element      //div[@role='listbox']//section
    Wait Until Page Contains Element       ${Budget}
    Click Element      ${Budget}
    Input Text        ${Budget}      12,200
    #Click Element      //div[@role='listbox']//section
    Element Should Be Enabled    ${Next_ImportantDates}
    Click Button    ${Next_ImportantDates}
    Sleep   3
    Wait Until Page Contains Element    ${Previous_GetStarted}
    Click Button    ${Previous_GetStarted}


Fill the form Marketplace

    Input Text          ${Title}       Important Dates Step (One time)
    Click Element        ${Properties}

    #Click Element        ${Title}
    #Click Element      ${Services_needed}

    #Click Element      //div[@role='listbox']//section
    Wait Until Page Contains Element       ${Budget}
    Click Element      ${Budget}
    Input Text        ${Budget}      12,200
    #Click Element      //div[@role='listbox']//section
    Element Should Be Enabled    ${Next_ImportantDates}
    Click Button    ${Next_ImportantDates}
    Sleep   3
    Wait Until Page Contains Element    ${Previous_GetStarted}
    Click Button    ${Previous_GetStarted}

verify error message is correct
   ${result_title}=   Get Value    ${Title_Filled}
   Should Be Equal As Strings     ${result_title}     Important Dates Step (One time)

   ${result_service}=   Get Value    ${Services_needed}
   Should Be Equal As Strings     ${result_service}     Air Purification


   ${Budget_amount}=   Get Value    ${Budget}
   Should Be Equal As Strings     ${Budget_amount}     $12,200
   sleep  3

   Click Button    ${Next_ImportantDates}

verify error message is correct only
   ${result_title}=   Get Value    ${Title_Filled}
   Should Be Equal As Strings     ${result_title}     Important Dates Step (One time)

   ${result_service}=   Get Value    ${Services_needed}
   Should Be Equal As Strings     ${result_service}     Air Purification


   ${Budget_amount}=   Get Value    ${Budget}
   Should Be Equal As Strings     ${Budget_amount}     $12,200
   sleep  3




Vendorlogo to create draft

   Click Element   ${Vendor_logo}
   Sleep  3
   Wait Until Page Contains Element   ${Leave_Header}
   Wait Until Page Contains Element   ${Leave_Message}
   Wait Until Page Contains Element   ${Stay_button}
   Wait Until Page Contains Element   ${Create_draft_button}

   Click Element     ${Stay_button}
   Sleep  3
   Click Element   ${Vendor_logo}
   Sleep  3
   Wait Until Page Contains Element   ${Leave_Header}
   Wait Until Page Contains Element   ${Leave_Message}
   Wait Until Page Contains Element   ${Stay_button}
   Wait Until Page Contains Element   ${Create_draft_button}
   Click Element     ${Create_draft_button}



Remove the service and verify pop up and select the vendors

   Click Element      ${Services_needed}
   Clear Element Text   ${Services_needed}
   Press Keys             ${Services_needed}                CTRL+A+DELETE

   #Click Element      ${Services_needed}
   #Clear Element Text   ${Services_needed}
   Input Text            ${Services_needed}   Window Cleaning
    Press Keys             ${Services_needed}                ENTER
   Click Element   xpath:(//mark[contains(@class,'')])
   #Wait until page contains  xpath:(//h1[contains(@class,'modal_title__wyikF')])
   #Wait until page contains  xpath:(//p[contains(text(),'Are you sure you want to change the service in thi')])
   Wait until page contains Element   xpath:(//button[normalize-space()='Cancel'])
   Wait until page contains Element  xpath:(//button[normalize-space()='Yes, change service'])
   Sleep  3
   Click Element     xpath:(//button[normalize-space()='Cancel'])
   Click Element      ${Services_needed}
   Clear Element Text   ${Services_needed}
   Press Keys             ${Services_needed}                CTRL+A+DELETE

   #Click Element      ${Services_needed}
   #Clear Element Text   ${Services_needed}
   Input Text            ${Services_needed}   Window Cleaning
    Press Keys             ${Services_needed}                ENTER
   Click Element   xpath:(//mark[contains(@class,'')])
   sleep  3
   #Wait until page contains  xpath:(//h1[contains(@class,'modal_title__wyikF')])
   #Wait until page contains  xpath:(//p[contains(text(),'Are you sure you want to change the service in thi')])
   Wait until page contains Element   xpath:(//button[normalize-space()='Cancel'])
   Wait until page contains Element   xpath:(//button[normalize-space()='Yes, change service'])
   Sleep  3
   Click Element    xpath:(//button[normalize-space()='Yes, change service'])
   Sleep  3
   Click Element      ${Title_Filled}

verify error message is correct after service change
   ${result_title}=   Get Value    ${Title_Filled}
   Should Be Equal As Strings     ${result_title}     Important Dates Step (One time)

   ${result_service}=   Get Value    ${Services_needed}
   Should Be Equal As Strings     ${result_service}     Window Cleaning


   ${Budget_amount}=   Get Value    ${Budget}
   Should Be Equal As Strings     ${Budget_amount}     $12,200
   sleep  3

   Click Button    ${Next_ImportantDates}






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
