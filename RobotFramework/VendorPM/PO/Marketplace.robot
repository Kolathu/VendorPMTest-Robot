*** Settings ***
Documentation     All the page objects and keywords of Dashboard page
Library           SeleniumLibrary
Resource        Generic.robot



*** Variables ***
${Marketplace_link}             xpath:(//p[normalize-space()='Marketplace'])
${Home_link}      xpath:(//p[normalize-space()='Home'])
${Inbox_link}      xpath:(//p[normalize-space()='Inbox'])
${Service_Planner_link}      xpath:(//p[normalize-space()='Service Planner'])
${Properties_link}        xpath:(//p[normalize-space()='Properties'])
${Preferred_Vendors_link}        xpath:(//p[normalize-space()='Preferred Vendors'])
${Quote_Requests_link}        xpath:(//p[normalize-space()='Quote Requests'])
${Service_selector}           xpath:(//input[@placeholder='Start typing to search...'])
${Marketplace_Header}         xpath:(//h1[normalize-space()='Welcome to the Vendor Marketplace'])
${Properties_select}         xpath:(//input[@id='Marketplace Search_properties'])
${Search_MarketPlace}       xpath:(//button[@type='submit'])
${select_service}         xpath:(//mark[contains(@class,'')])
${Property_select}       xpath:(//div[contains(@class,'ant-select-item-option-content')])
${Property_unselect}   xpath:(//span[@aria-label='close']//*[name()='svg'])
${Select_property_error}    xpath:(//div[contains(@role,'alert')])
${Select_service_error}     xpath:(//div[@role='alert'])
${open_logout}     xpath:(//p[normalize-space()='testpm pmvendor'])
${logout}       xpath:((//li[@role='menuitem'])[4])




*** Keywords ***

Verify page contents on Dashbaord
    Maximize Browser Window
    Wait Until Page Contains Element  ${Marketplace_link}
    Wait Until Page Contains Element  ${Home_link}
    Wait Until Page Contains Element  ${Inbox_link}
    Wait Until Page Contains Element  ${Service_Planner_link}
    Wait Until Page Contains Element  ${Properties_link}
    Wait Until Page Contains Element  ${Preferred_Vendors_link}
    #Page Should Not Contain Element  ${frequency}
    Wait Until Page Contains Element  ${Quote_Requests_link}
    #Wait Until Page Contains Element  ${itemdescription}
   Click Element    ${Marketplace_link}

Verify Logout options
   Wait Until Page Contains Element  ${open_logout}
   Click Element   ${open_logout}
   Set Selenium Implicit Wait  5
   Wait Until Page Contains Element   ${logout}

Logout as PM
   Click Element    ${logout}
   Set Selenium Implicit Wait  5


Verify Marketplace Page contents
    Wait Until Page Contains Element  ${Marketplace_Header}
    Wait Until Page Contains Element  ${Service_selector}
    Wait Until Page Contains Element  ${Properties_select}
    Wait Until Page Contains Element  ${Search_MarketPlace}

Verify Error alerts

    Click Element   ${Search_MarketPlace}
    Wait Until Page Contains Element  ${Select_property_error}
    Wait Until Page Contains Element  ${Select_service_error}
    Sleep   3
    Click Element     ${Properties_select}
    Sleep   3
    Input Text      ${Properties_select}    these
    Click Element   ${Property_select}
    Click Element   ${Search_MarketPlace}
    Wait Until Page Contains Element  ${Select_service_error}
    Sleep  3
    Click Element  ${Property_unselect}
    Sleep  3
    Click Element   ${Service_selector}
    Sleep   3
    Input Text      ${Service_selector}    Air Purification
    Click Element   ${select_service}
    Click Element   ${Search_MarketPlace}
    Wait Until Page Contains Element  ${Select_property_error}
    Sleep  3


Fill the Service and property

     #Click Element   ${Service_selector}
     #Sleep   3
     #Input Text      ${Service_selector}    Air Filter Supplier
     #Click Element   ${select_service}
     ${result_service}=   Get Value    ${Service_selector}
     Should Be Equal As Strings     ${result_service}     Air Purification
     Click Element     ${Properties_select}
     Sleep   3
     Input Text      ${Properties_select}    these
     Click Element   ${Property_select}
     Sleep  3
     Click Element  ${Property_unselect}
     Sleep  3
     Click Element     ${Properties_select}
     Sleep   3
     Input Text      ${Properties_select}    these
     Click Element   ${Property_select}
     Click Element   ${Search_MarketPlace}


Select the draft
    Click Element   xpath:(/html[1]/body[1]/div[2]/section[1]/section[1]/section[1]/main[1]/section[1]/div[3]/div[1]/div[1]/div[1]/div[1]/a[1]/h6[1])


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
