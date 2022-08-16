*** Settings ***
Documentation     All the page objects and keywords of Dashboard page
Library           SeleniumLibrary
Resource        Generic.robot



*** Variables ***
${Vendorheader_results}             xpath:(//h1[contains(@class,'undefined')])
${service_selected_text}      xpath:(//b[normalize-space()='Air Purification'])
${AddVendor_link}      xpath:(//h3[contains(@class,'select_vendors_addVendorText__I7LYT')])
${Search_Vendor}      xpath:(//input[@placeholder='Search for company'])
${invite_bid_button}        xpath:(//button[normalize-space()='Invite to bid'])
${Remove_button_Vendor}        xpath:(//button[contains(@class,'button_default__8hEAQ')][normalize-space()='Remove'])
${Remove_cart_Vendor}        xpath:(//button[contains(@class,'button_danger__rHzUS button_ghost__FZA44')])
${New_Quote_Button}           xpath:(//button[normalize-space()='Add to new quote request'])




*** Keywords ***

Verify page contents on Vendorspage
    #Maximize Browser Window
    Wait Until Page Contains Element  ${Vendorheader_results}
    Wait Until Page Contains Element  ${service_selected_text}
    Wait Until Page Contains Element  ${Search_Vendor}
    Wait Until Page Contains Element  ${AddVendor_link}
    Click Element    ${Search_Vendor}



Invite a Vendor

    Input Text    ${Search_Vendor}       testvendorcomp
    ${Vendor_name}=   Get Value    ${Search_Vendor}
    Should Be Equal As Strings      ${Vendor_name}       testvendorcomp
    Sleep   8
    Click Element   ${invite_bid_button}
    Wait Until Page Contains Element    xpath:(//p[normalize-space()='You have added 1 vendor to your quote request.'])
    Wait Until Page Contains Element    xpath:(//h4[normalize-space()='testvendorcomp'])
    Click Element    ${Remove_button_Vendor}
    Sleep  2
    Click Element     ${invite_bid_button}
    Wait Until Page Contains Element    xpath:(//p[normalize-space()='You have added 1 vendor to your quote request.'])
    Wait Until Page Contains Element    xpath:(//h4[normalize-space()='testvendorcomp'])
    Click Element    ${Remove_cart_Vendor}
    Sleep  2
    Click Element     ${invite_bid_button}
    Wait Until Page Contains Element    xpath:(//p[normalize-space()='You have added 1 vendor to your quote request.'])
    Wait Until Page Contains Element    xpath:(//h4[normalize-space()='testvendorcomp'])
    Click Element   ${New_Quote_Button}

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
