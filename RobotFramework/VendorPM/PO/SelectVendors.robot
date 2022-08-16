*** Settings ***
Documentation     All the page objects and keywords of Dashboard page
Library           SeleniumLibrary
Resource        Generic.robot



*** Variables ***
${search_company}             xpath:(//input[@placeholder='Search for company'])
${bidslink}      xpath:(//h3[normalize-space()='Assistance with getting 3 bids'])
${AddVendorlink}      xpath:(//span[contains(@class,'link')])
${Invitebid}      xpath:(//button[normalize-space()='Invite to bid'])
${Removebutton}        xpath:((//button[contains(@type,'button')][normalize-space()='Remove'])[3])
${Removecart}        xpath:(//body/div/section/section/section/main/div/div/div/div/div/div/div/div/button[1])
${progressbarnav}        xpath:(//h3[normalize-space()='Scope of Work'])
${Next_ReviewSubmit}     xpath:(//button[contains(@class,'button_primary__M6ILH footer_nextBtn__mNQMl')])
${yesbids}          xpath:(//button[normalize-space()='Yes, get me 3 bids'])
${nobids}        xpath:(//button[normalize-space()='Continue without bid support'])



*** Keywords ***

Verify page contents on scope of work
    Wait Until Page Contains Element  ${search_company}
    Wait Until Page Contains Element  ${bidslink}
    Wait Until Page Contains Element  ${AddVendorlink}
    #Page Should Not Contain Element  ${frequency}
    #Wait Until Page Contains Element  ${newitemlink}
    #Wait Until Page Contains Element  ${itemdescription}

Select the Vendor

    Input Text    ${search_company}        testvendorcomp
    ${Vendor_name}=   Get Value    ${search_company}
    Should Be Equal As Strings      ${Vendor_name}       testvendorcomp
    Sleep   8
    Click Element     ${Invitebid}
    Wait Until Page Contains Element    xpath:(//p[normalize-space()='You have added 1 vendor to your quote request.'])
    Wait Until Page Contains Element    xpath:(//h4[normalize-space()='testvendorcomp'])
    Click Element    ${Removebutton}
    Sleep  2
    Click Element     ${Invitebid}
    Wait Until Page Contains Element    xpath:(//p[normalize-space()='You have added 1 vendor to your quote request.'])
    Wait Until Page Contains Element    xpath:(//h4[normalize-space()='testvendorcomp'])
    Click Element    ${Removecart}
    Sleep  2
    Click Element     ${Invitebid}
    Wait Until Page Contains Element    xpath:(//p[normalize-space()='You have added 1 vendor to your quote request.'])
    Wait Until Page Contains Element    xpath:(//h4[normalize-space()='testvendorcomp'])

Select the Vendor MarketPlace


    Wait Until Page Contains Element    xpath:(//p[normalize-space()='You have added 1 vendor to your quote request.'])
    Wait Until Page Contains Element    xpath:(//h4[normalize-space()='testvendorcomp'])
    Sleep  5
    Click Element    ${Removebutton}
    Input Text    ${search_company}        testvendorcomp
    ${Vendor_name}=   Get Value    ${search_company}
    Should Be Equal As Strings      ${Vendor_name}       testvendorcomp
    Sleep  8
    Click Element     ${Invitebid}
    Wait Until Page Contains Element    xpath:(//p[normalize-space()='You have added 1 vendor to your quote request.'])
    Wait Until Page Contains Element    xpath:(//h4[normalize-space()='testvendorcomp'])
    Click Element    ${Removecart}
    Sleep  2
    Click Element     ${Invitebid}
    Wait Until Page Contains Element    xpath:(//p[normalize-space()='You have added 1 vendor to your quote request.'])
    Wait Until Page Contains Element    xpath:(//h4[normalize-space()='testvendorcomp'])

Verify progressbar link
   Click Element  ${progressbarnav}

Verify after progress bar navigation
   Wait Until Page Contains Element    xpath:(//p[normalize-space()='You have added 1 vendor to your quote request.'])
    Wait Until Page Contains Element    xpath:(//h4[normalize-space()='testvendorcomp'])

Navigate to pop up
    Sleep    3
    Click Element  ${Next_ReviewSubmit}
    Sleep   3
    Click Element  ${yesbids}

Navigate to Review
   Sleep    3
   Click Element  ${Next_ReviewSubmit}


#

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
