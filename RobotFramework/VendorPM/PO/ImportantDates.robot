*** Settings ***
Documentation     All the page objects and keywords of Dashboard page
Library           SeleniumLibrary
Resource        Generic.robot



*** Variables ***
${Deadline_for_quote_submission}             xpath:(//label[contains(text(),'Deadline for quote submission')])
${Deadline_time}      xpath:(//label[contains(text(),'Deadline time')])
${startDate}      xpath:(//label[@for='startDate'])
${endDate}      xpath:(//label[contains(@for,'endDate')]//label[contains(@for,'endDate')])
${frequency}        xpath:(//label[contains(@for,'frequency')]//label[contains(@for,'frequency')])
${frequency_select}        xpath:(//body[1]/div[2]/section[1]/section[1]/section[1]/main[1]/div[3]/div[2]/div[3]/form[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[1])
${frequency_dropselect}        xpath:(//body[1]/div[2]/section[1]/section[1]/section[1]/main[1]/div[3]/div[2]/div[3]/form[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[2]/div[1])
${AddprojectEndate}                   xpath:(//body/div/section/section/section/main/div/div/div/form/p[1])
${Recurring}          css:body > div:nth-child(5) > section:nth-child(2) > section:nth-child(1) > section:nth-child(2) > main:nth-child(1) > div:nth-child(3) > div:nth-child(2) > div:nth-child(3) > form:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > label:nth-child(2) > span:nth-child(2) > div:nth-child(1)
${Onetime}     css:body > div:nth-child(5) > section:nth-child(2) > section:nth-child(1) > section:nth-child(2) > main:nth-child(1) > div:nth-child(3) > div:nth-child(2) > div:nth-child(3) > form:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > label:nth-child(1) > span:nth-child(2) > div:nth-child(1)
${quotecalendar}     xpath:(//body[1]/div[2]/section[1]/section[1]/section[1]/main[1]/div[3]/div[2]/div[3]/form[1]/div[2]/div[2]/div[1]/div[1]/div[1]/div[1]/input[1])
${startdatecalendar}     xpath:(//body[1]/div[2]/section[1]/section[1]/section[1]/main[1]/div[3]/div[2]/div[3]/form[1]/div[4]/div[2]/div[1]/div[1]/div[1]/div[1]/input[1])
${quoteclick}     xpath:((//input[@placeholder='Click to select date'])[1])
${nextmonth}     xpath:(//button[contains(@class,'ant-picker-header-next-btn')])
${quotemiddledateselect}    css:body > div:nth-child(5) > section:nth-child(2) > section:nth-child(1) > section:nth-child(2) > main:nth-child(1) > div:nth-child(3) > div:nth-child(2) > div:nth-child(3) > form:nth-child(1) > div:nth-child(2) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > table:nth-child(1) > tbody:nth-child(2) > tr:nth-child(2) > td:nth-child(4) > div:nth-child(1)
${startdateclick}      xpath:(//body[1]/div[2]/section[1]/section[1]/section[1]/main[1]/div[3]/div[2]/div[3]/form[1]/div[4]/div[2]/div[1]/div[1]/div[1])
${startdatenextmonth}    xpath:((//button[contains(@type,'button')])[12])
${startdatemiddleselect}    xpath:((//input[contains(@placeholder,'Click to select date')])[2])
${Startdateinput}    xpath:((//input[@placeholder='Click to select date'])[1])
${Enddatenextmonth}     xpath:((//button[contains(@type,'button')])[18])
${Enddatemiddleselect}     xpath:((//input[contains(@placeholder,'Click to select date')])[3])
${Enddateclick}      xpath:(//body[1]/div[2]/section[1]/section[1]/section[1]/main[1]/div[3]/div[2]/div[3]/form[1]/div[5]/div[2]/div[1]/div[1]/div[1]/div[1]/input[1])
${Previous_Importantdates}     xpath:(//body/div[@id='root']/section[@id='app-layout']/section/section/main[@id='app-layout-content']/div/div/div/button[1])
${ideal_startdate}          xpath:(//input[@id='startDate'])
${ideal_enddate}       xpath:(//input[@id='endDate'])

*** Keywords ***

Verify project selected as default
    Wait Until Page Contains Element  ${Deadline_for_quote_submission}
    Wait Until Page Contains Element  ${Deadline_time}
    Wait Until Page Contains Element  ${startDate}
    Page Should Not Contain Element  ${frequency}
    Wait Until Page Contains Element  ${AddprojectEndate}
    sleep  3
    Click Element      ${AddprojectEndate}
    Wait Until Page Contains Element  ${endDate}

Verify Contract selected as default
   Click Element      ${Recurring}
   Wait Until Page Contains Element  ${Deadline_for_quote_submission}
    Wait Until Page Contains Element  ${Deadline_time}
    Wait Until Page Contains Element  ${startDate}
    Wait Until Page Contains Element  ${frequency}
    Click Element    ${frequency_select}
    Click Element   ${frequency_dropselect}
    ${frequency_value}=   Get Text    ${frequency_dropselect}
    Should Be Equal As Strings      ${frequency_value}       This is a contract with bi-weekly work
    Click Element      ${Onetime}


Verify Contract selected
   Click Element      ${Recurring}
   Wait Until Page Contains Element  ${Deadline_for_quote_submission}
    Wait Until Page Contains Element  ${Deadline_time}
    Wait Until Page Contains Element  ${startDate}
    Wait Until Page Contains Element  ${frequency}
    #Click Element      ${Onetime}

Verify project selection
    Wait Until Page Contains Element  ${Deadline_for_quote_submission}
    Wait Until Page Contains Element  ${Deadline_time}
    Wait Until Page Contains Element  ${startDate}
    Page Should Not Contain Element  ${frequency}

    Wait Until Page Contains Element  ${endDate}


Fill the Contract RFQ
   Click Element      ${Recurring}
   Wait Until Page Contains Element  ${Deadline_for_quote_submission}
    Wait Until Page Contains Element  ${Deadline_time}
    Wait Until Page Contains Element  ${startDate}
    Wait Until Page Contains Element  ${frequency}
    Click Element    ${frequency_select}
    Click Element   ${frequency_dropselect}
    ${frequency_value}=   Get Text    ${frequency_dropselect}
    Should Be Equal As Strings      ${frequency_value}       This is a contract with bi-weekly work


Fill the form
    Sleep  3
    Click Element    ${quoteclick}
    Wait Until Page Contains Element         ${nextmonth}
    Click Element        ${nextmonth}
    Click Element       ${quotemiddledateselect}

Fill the form Contract
    Sleep  3
    Click Element    ${quoteclick}
    Wait Until Page Contains Element         ${nextmonth}
    Click Element        ${nextmonth}
    Click Element       css:body > div:nth-child(5) > section:nth-child(2) > section:nth-child(1) > section:nth-child(2) > main:nth-child(1) > div:nth-child(3) > div:nth-child(2) > div:nth-child(3) > form:nth-child(1) > div:nth-child(3) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > table:nth-child(1) > tbody:nth-child(2) > tr:nth-child(3) > td:nth-child(4) > div:nth-child(1)
    #Click Element    ${Startdateinput}
    #Wait Until Page Contains Element       ${startdatemiddleselect}
    #Input Text      ${Startdateinput}     August 10, 2022
    #Press Keys             ${Startdateinput}               ENTER


verify time selected is correct
   ${Date_result}=   Get Value    xpath:(//input[@placeholder='Click to select time'])
   Should Be Equal As Strings     ${Date_result}    5 PM

Fill the Enddate
     Sleep   3
     Click Element    ${startdateclick}
     Sleep  3
    #Wait Until Page Contains Element         xpath://button[@class='ant-picker-header-next-btn']
    #Execute Javascript       document.getElementByxpath('//button[@class='ant-picker-header-next-btn']').onclick()
    #Wait Until Page Contains Element         xpath://button[@class='ant-picker-header-next-btn']
    Click Button        ${startdatenextmonth}
    Click Button        ${startdatenextmonth}
    #Click Button       ${startdatemiddleselect}
    Wait Until Page Contains Element       ${startdatemiddleselect}
    Click Element      css:body > div:nth-child(5) > section:nth-child(2) > section:nth-child(1) > section:nth-child(2) > main:nth-child(1) > div:nth-child(3) > div:nth-child(2) > div:nth-child(3) > form:nth-child(1) > div:nth-child(4) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > table:nth-child(1) > tbody:nth-child(2) > tr:nth-child(2) > td:nth-child(5) > div:nth-child(1)
    #Input Text      ${startdatemiddleselect}     September 22, 2022
    #Press Keys             ${startdateclick}               ENTER
    Click Element    ${Enddatemiddleselect}
    Wait Until Page Contains Element        ${Enddatemiddleselect}
    Sleep  3
    Click Button        ${Enddatenextmonth}
    Click Button        ${Enddatenextmonth}
    Click Button        ${Enddatenextmonth}
    Click Element       css:body > div:nth-child(5) > section:nth-child(2) > section:nth-child(1) > section:nth-child(2) > main:nth-child(1) > div:nth-child(3) > div:nth-child(2) > div:nth-child(3) > form:nth-child(1) > div:nth-child(5) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > table:nth-child(1) > tbody:nth-child(2) > tr:nth-child(3) > td:nth-child(4) > div:nth-child(1)
    #Input Text      ${Enddatemiddleselect}     November 22, 2022
    #Press Keys             ${Enddatemiddleselect}                ENTER


Fill the Enddate for contract
     Click Element    xpath:(//body[1]/div[2]/section[1]/section[1]/section[1]/main[1]/div[3]/div[2]/div[3]/form[1]/div[5]/div[2]/div[1]/div[1]/div[1]/div[1]/input[1])
    #Wait Until Page Contains Element         xpath://button[@class='ant-picker-header-next-btn']
    #Execute Javascript       document.getElementByxpath('//button[@class='ant-picker-header-next-btn']').onclick()
    #Wait Until Page Contains Element         xpath://button[@class='ant-picker-header-next-btn']
    #Click Button        xpath://button[@class='ant-picker-header-next-btn']
    #Click Button       ${startdatemiddleselect}
    Wait Until Page Contains Element       xpath:(//body[1]/div[2]/section[1]/section[1]/section[1]/main[1]/div[3]/div[2]/div[3]/form[1]/div[5]/div[2]/div[1]/div[1]/div[1]/div[1]/input[1])
    Sleep  3
    Click Button        ${startdatenextmonth}
    Click Button        ${startdatenextmonth}
    Wait Until Page Contains Element   css:body > div:nth-child(5) > section:nth-child(2) > section:nth-child(1) > section:nth-child(2) > main:nth-child(1) > div:nth-child(3) > div:nth-child(2) > div:nth-child(3) > form:nth-child(1) > div:nth-child(5) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > table:nth-child(1) > tbody:nth-child(2) > tr:nth-child(2) > td:nth-child(5) > div:nth-child(1)
    Click Element      css:body > div:nth-child(5) > section:nth-child(2) > section:nth-child(1) > section:nth-child(2) > main:nth-child(1) > div:nth-child(3) > div:nth-child(2) > div:nth-child(3) > form:nth-child(1) > div:nth-child(5) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > table:nth-child(1) > tbody:nth-child(2) > tr:nth-child(2) > td:nth-child(5) > div:nth-child(1)
    #Input Text      xpath:(//body[1]/div[2]/section[1]/section[1]/section[1]/main[1]/div[3]/div[2]/div[3]/form[1]/div[5]/div[2]/div[1]/div[1]/div[1]/div[1]/input[1])    September 22, 2022
    #Press Keys             xpath:(//body[1]/div[2]/section[1]/section[1]/section[1]/main[1]/div[3]/div[2]/div[3]/form[1]/div[5]/div[2]/div[1]/div[1]/div[1]/div[1]/input[1])              ENTER
    Click Element    ${ideal_enddate}
    Wait Until Page Contains Element        ${ideal_enddate}
    Sleep  3
    Click Button        ${Enddatenextmonth}
    Click Button        ${Enddatenextmonth}
    Click Button        ${Enddatenextmonth}
    Wait Until Page Contains Element   css:body > div:nth-child(5) > section:nth-child(2) > section:nth-child(1) > section:nth-child(2) > main:nth-child(1) > div:nth-child(3) > div:nth-child(2) > div:nth-child(3) > form:nth-child(1) > div:nth-child(6) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > table:nth-child(1) > tbody:nth-child(2) > tr:nth-child(3) > td:nth-child(4) > div:nth-child(1)
    Sleep  3
    Click Element       css:body > div:nth-child(5) > section:nth-child(2) > section:nth-child(1) > section:nth-child(2) > main:nth-child(1) > div:nth-child(3) > div:nth-child(2) > div:nth-child(3) > form:nth-child(1) > div:nth-child(6) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > table:nth-child(1) > tbody:nth-child(2) > tr:nth-child(3) > td:nth-child(4) > div:nth-child(1)
    #Input Text      ${ideal_enddate}     November 22, 2022
    #Press Keys             ${ideal_enddate}               ENTER

verify Dates are correct
   ${start_dateverify}=   Get Value    ${ideal_startdate}
   ${start_date}=   Get Value    ${ideal_startdate}
   Should Be Equal As Strings     ${start_date}     ${start_dateverify}
   ${end_dateverify}=   Get Value    ${ideal_enddate}
   ${end_date}=   Get Value    ${ideal_enddate}
   Should Be Equal As Strings     ${end_date}     ${end_dateverify}
   Sleep   3
   Click Button    ${Next_ImportantDates}

Verify Dates correct after moving
     Click Button    ${Previous_Importantdates}
   ${start_dateverify}=   Get Value    ${ideal_startdate}
   ${start_date}=   Get Value    ${ideal_startdate}
   Should Be Equal As Strings     ${start_date}     ${start_dateverify}
   ${end_dateverify}=   Get Value    ${ideal_enddate}
   ${end_date}=   Get Value    ${ideal_enddate}
   Should Be Equal As Strings     ${end_date}     ${end_dateverify}

   Click Button    ${Next_ImportantDates}


verify Dates are correct after change service
   ${start_dateverify}=   Get Value    ${ideal_startdate}
   ${start_date}=   Get Value    ${ideal_startdate}
   Should Be Equal As Strings     ${start_date}     ${start_dateverify}
   Click Element      ${AddprojectEndate}
   Sleep  3
   #Input Text      ${ideal_enddate}     November 22, 2022
   #Press Keys             ${ideal_enddate}               ENTER

   ${end_dateverify}=   Get Value    ${ideal_enddate}
   ${end_date}=   Get Value    ${ideal_enddate}
   Should Be Equal As Strings     ${end_date}     ${end_dateverify}
   Sleep   3
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
