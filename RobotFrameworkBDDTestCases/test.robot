*** Settings ***
Documentation     A test suite to test the functionality of e-commerce web app
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../resources/resource.robot
Library           SeleniumLibrary
Test Teardown     Close All Browsers

*** Test Cases ***
Valid Login
    [Tags]  authentication
    Open Browser and Navigate To Page
    Input   Username    standard_user
    Input   Password    secret_sauce
    Submit Credentials
    Welcome Page Should Be Open
