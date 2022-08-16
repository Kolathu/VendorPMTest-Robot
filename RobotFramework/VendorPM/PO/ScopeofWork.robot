*** Settings ***
Documentation     All the page objects and keywords of Dashboard page
Library           SeleniumLibrary
Resource        Generic.robot



*** Variables ***
${Description}             xpath:(//textarea[@id='notes'])
${attachment_label}      xpath:(//h3[normalize-space()='Attach scope of work documents & site images'])
${attachment_input}      xpath:(//input[contains(@id,'attachments')])
${attachment_close}      xpath:(//div[contains(@class,'attachments_deleteBtn__hzRqm')])
${itembreakdown}      xpath:(//input[contains(@placeholder,'e.g. Exterior Windows')])
${itemdescription}      xpath:(//textarea[@id='description'])
${newitemlink}        xpath:(//button[normalize-space()='+ Create new line item'])
${itembreakdown2}        xpath:(//body[1]/div[2]/section[1]/section[1]/section[1]/main[1]/div[3]/div[2]/div[4]/section[1]/div[1]/div[2]/form[1]/div[2]/div[2]/div[1]/div[1]/input[1])
${itemdescription2}        xpath:(//body[1]/div[2]/section[1]/section[1]/section[1]/main[1]/div[3]/div[2]/div[4]/section[1]/div[1]/div[2]/form[1]/div[3]/div[2]/div[1]/div[1]/textarea[1])
${Next_selectVendors}              css:body > div:nth-child(5) > section:nth-child(2) > section:nth-child(1) > section:nth-child(2) > main:nth-child(1) > div:nth-child(3) > div:nth-child(3) > div:nth-child(1) > button:nth-child(2)
${Previous_scopeofwork}          css:body > div:nth-child(5) > section:nth-child(2) > section:nth-child(1) > section:nth-child(2) > main:nth-child(1) > div:nth-child(3) > div:nth-child(3) > div:nth-child(1) > button:nth-child(1)


*** Keywords ***

Verify page contents on scope of work
    Wait Until Page Contains Element  ${Description}
    Wait Until Page Contains Element  ${attachment_label}
    Wait Until Page Contains Element  ${itembreakdown}
    #Page Should Not Contain Element  ${frequency}
    Wait Until Page Contains Element  ${newitemlink}
    Wait Until Page Contains Element  ${itemdescription}

Fill the Scopeofwork
    Input Text    ${Description}        Testing the description for the automation to make sure 100 minimum character is fulfilled and making sure we can move forward
    ${description_value}=   Get Text    ${Description}
    Should Be Equal As Strings      ${description_value}       Testing the description for the automation to make sure 100 minimum character is fulfilled and making sure we can move forward

Fill the upload file
    Wait Until Page Contains Element     ${attachment_input}
    #Click Element     xpath:(//body//div//section//section//section//main//div//div//div//form//section//div//div//div//div//span//div//span[@role='button'])
    Choose File   ${attachment_input}       C:/Users/kolat/PycharmProjects/RobotFramework/VendorPM/Upload/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg
    Sleep   5
    Wait Until Page Contains Element    ${attachment_close}
    Click Element   ${attachment_close}
    Sleep  3
    Choose File   ${attachment_input}       C:/Users/kolat/PycharmProjects/RobotFramework/VendorPM/Upload/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg
    Sleep   5
    Wait Until Page Contains Element    ${attachment_close}

Fill line items

   Input Text   ${itembreakdown}    test the item
   Input Text   ${itemdescription}    test the description item
   Click Element   ${newitemlink}
   Input Text   ${itembreakdown2}    test the item2
   Input Text    ${itemdescription2}   test the description item2

Verify Line items
    ${item_value}=   Get Value    ${itembreakdown}
    Should Be Equal As Strings      ${item_value}       test the item
    ${itemdescription_value}=   Get Value    ${itemdescription}
    Should Be Equal As Strings      ${itemdescription_value}       test the description item
    ${description_value}=   Get Text    ${Description}
    Should Be Equal As Strings      ${description_value}       Testing the description for the automation to make sure 100 minimum character is fulfilled and making sure we can move forward

Verify Line items after change service
    ${item_value}=   Get Value    ${itembreakdown}
    Should Be Equal As Strings      ${item_value}       test the item
    ${itemdescription_value}=   Get Value    ${itemdescription}
    Should Be Equal As Strings      ${itemdescription_value}       test the description item
        Input Text    ${Description}        Testing the description for the automation to make sure 100 minimum character is fulfilled and making sure we can move forward
    ${description_value}=   Get Text    ${Description}
    Should Be Equal As Strings      ${description_value}       Testing the description for the automation to make sure 100 minimum character is fulfilled and making sure we can move forward
    ${description_value}=   Get Text    ${Description}
    Should Be Equal As Strings      ${description_value}       Testing the description for the automation to make sure 100 minimum character is fulfilled and making sure we can move forward

Verify Scope of Work
    Sleep   3
    Click Element    ${Next_selectVendors}
    Sleep   3
    Click Element    ${Previous_scopeofwork}
Land to Select Vendors
     Sleep   3
    Click Element    ${Next_selectVendors}

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
