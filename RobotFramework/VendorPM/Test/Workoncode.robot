*** Settings ***

Documentation   To validate the login page
Library     SeleniumLibrary
Test Setup      open the browser with the Stage url
#Test Teardown   Close Browser session
Resource        ../PO/Generic.robot
Resource        ../PO/VendorDashboard.robot
Resource        ../PO/VendorQuote.robot
Resource        ../PO/Marketplace.robot
Resource        ../PO/LandingPage.robot
Resource        ../PO/DashboardPage.robot
Resource        ../PO/CreateRFQbybutton.robot
Resource        ../PO/GetStartedpage.robot
Resource        ../PO/ImportantDates.robot
Resource        ../PO/ScopeofWork.robot
Resource        ../PO/SelectVendors.robot
Resource        ../PO/ReviewandSubmit.robot


*** Test Cases ***
Validate login page

           validate page contents
           #Login with invalid credentails
           Login with valid credentails
           verify page contents on dashboard
           Verify logout
           Login with valid credentails Vendor
           #Initiate RFQ from Dashboard
           #Fill the RFQ Get Started
           #Fill the Dates
           #Verify Scope of Work
           #Fill the Scope of Work
           #Select Vendors
           #Review and Submit

*** Keywords ***


validate page contents
     Wait Until Page Contains Element     xpath:(//button[@type='submit'])
     Element Text Should be     xpath=//label[@title='Email Address']   Email Address
     Element Text Should be     xpath=//label[@title='Password']   Password
     Page Should Contain Element    xpath=//body/div[@id='root']/section[@id='landing-layout']/main/div[@id='login']/div[@id='login-col']/div/div[1]/div[2]
     Page Should Contain Checkbox   xpath=//input[@type='checkbox']
     Page Should Contain Element   xpath=//a[@href='/signup']//span
     #Click Element   xpath=//a[@href='/signup']//span
     #Go back

Login with invalid credentails
     LandingPage.Fill the login Form     ${user_name_PM}    ${invalid_password}
     LandingPage.wait until Element is located in the page
     LandingPage.verify error message is correct

Login with valid credentails
     Reload Page
     Wait Until Page Contains Element     xpath:(//button[@type='submit'])
     LandingPage.Fill the login Form     ${user_name_PM}    ${valid_password}

verify page contents on dashboard
     DashboardPage.wait until Element is located in the page

Verify Logout
     CreateRFQbybutton.wait until Element is located in the page
     Marketplace.Verify Logout options
     Marketplace.Logout as PM
     Wait Until Page Contains Element     xpath:(//button[@type='submit'])
     Element Text Should be     xpath=//label[@title='Email Address']   Email Address
     Element Text Should be     xpath=//label[@title='Password']   Password
     Page Should Contain Element    xpath=//body/div[@id='root']/section[@id='landing-layout']/main/div[@id='login']/div[@id='login-col']/div/div[1]/div[2]
     Page Should Contain Checkbox   xpath=//input[@type='checkbox']
     Page Should Contain Element   xpath=//a[@href='/signup']//span

verify page contents on dashboard Vendor
     DashboardPage.wait until Element is located in the page Vendor

Login with valid credentails Vendor
     Reload Page
     Wait Until Page Contains Element     xpath:(//button[@type='submit'])
     LandingPage.Fill the login Form     ${user_name_Vendor}    ${valid_password}
     VendorDashboard.Verify page contents on Vendor Dashboard
     VendorQuote.Verify page contents on Vendor Dashboard
     VendorQuote.Select the RFQ to accept work
     VendorQuote.Verify decline and accept works

Initiate RFQ from Dashboard
     CreateRFQbybutton.wait until Element is located in the page
     CreateRFQbybutton.Click on Create RFQ

Fill the RFQ Get Started
     GetStartedpage.Fill the form
     GetStartedpage.verify error message is correct

Fill the Dates
     ImportantDates.Verify project selected as default
     ImportantDates.Verify Contract selected as default
     ImportantDates.Verify project selection
     ImportantDates.Fill the form
     ImportantDates.verify time selected is correct
     ImportantDates.Fill the Enddate
     ImportantDates.verify Dates are correct
     ImportantDates.Verify Dates correct after moving

Verify Scope of Work
     ScopeofWork.Verify page contents on scope of work

Fill the Scope of Work
     ScopeofWork.Fill the Scopeofwork
     #ScopeofWork.Fill the upload file
     ScopeofWork.Fill line items
     ScopeofWork.Verify Line items
     ScopeofWork.Verify Scope of Work
     ScopeofWork.Verify Line items
     ScopeofWork.Land to Select Vendors

Select Vendors
    SelectVendors.Verify page contents on scope of work
    SelectVendors.Select the Vendor
    SelectVendors.Verify progressbar link
    ScopeofWork.Verify Line items
    ScopeofWork.Land to Select Vendors
    SelectVendors.Verify after progress bar navigation
    SelectVendors.Navigate to pop up

Review and Submit
   ReviewandSubmit.Verify page contents on review
   ReviewandSubmit.Verify progressbar link to Select Vendors
   SelectVendors.Verify after progress bar navigation
   SelectVendors.Navigate to Review
   ReviewandSubmit.Navigate to Quotepage

