*** Settings ***
Documentation     All the page objects and keywords of Dashboard page
Library           SeleniumLibrary
Resource        Generic.robot



*** Variables ***
${Header_title}             xpath:(//h1[contains(@class,'header_title__fQEq3')])
${Header_label}      xpath:(//h2[normalize-space()='Main Details'])
${RFQ_title}      xpath:(//h6[normalize-space()='Important Dates Step (One time)'])
${RFQ_Service}      xpath:(//h6[normalize-space()='Air Purification'])
${RFQ_Change_Service}      xpath:(//h6[normalize-space()='Window Cleaning'])
${Bids_confirm}        xpath:(//h3[normalize-space()='Getting you 3 bids'])
${Submit_RFQ_button}        xpath:(//button[normalize-space()='Send quote request to vendors'])
${Progressbar_previous}        xpath:(//h3[normalize-space()='Select Vendors'])
${Success_RFQ}           xpath:(//h1[contains(@class,'footer_successTitle__vxbYF')])
${Showmylisting_Button}         xpath:(//button[normalize-space()='Show my listing'])
${Quote_page_title}         xpath:(//h3[normalize-space()='Vendor Statuses & Quotes'])


*** Keywords ***

Verify page contents on review
    Wait Until Page Contains Element  ${Header_title}
    Wait Until Page Contains Element  ${Header_label}
    Wait Until Page Contains Element  ${RFQ_title}
    Wait Until Page Contains Element  ${RFQ_Service}
    Wait Until Page Contains Element  ${Bids_confirm}
    Wait Until Page Contains Element  ${Submit_RFQ_button}
    #Page Should Not Contain Element  ${frequency}
    #Wait Until Page Contains Element  ${newitemlink}
    #Wait Until Page Contains Element  ${itemdescription}

Verify page contents on review after change service
    Wait Until Page Contains Element  ${Header_title}
    Wait Until Page Contains Element  ${Header_label}
    Wait Until Page Contains Element  ${RFQ_title}
    Wait Until Page Contains Element  ${RFQ_Change_Service}
    Wait Until Page Contains Element  ${Bids_confirm}
    Wait Until Page Contains Element  ${Submit_RFQ_button}
    #Page Should Not Contain Element  ${frequency}
    #Wait Until Page Contains Element  ${newitemlink}
    #Wait Until Page Contains Element  ${itemdescription}

Verify progressbar link to Select Vendors
   Click Element    ${Progressbar_previous}

Navigate to Quotepage
   Click Element   ${Submit_RFQ_button}
   Wait Until Page Contains Element  ${Success_RFQ}
   Sleep   3
   Click Element   ${Showmylisting_Button}
   #Click Element   xpath:(//button[normalize-space()='Create new quote request'])
   Wait Until Page Contains Element   ${Quote_page_title}




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
