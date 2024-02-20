*** Settings ***
Library           SeleniumLibrary
Library           ../libraries/chrome_options.py
Library           SeleniumLibrary


*** Variables ***
${LOGIN_PAGE_URL}        https://www.saucedemo.com/
${USERNAME}              standard_user
${PASSWORD}              secret_sauce
${browser}               chrome


*** Keywords ***
Given user logs into SwagLabs
    Open Browser    ${LOGIN_PAGE_URL}    ${browser}
    Input Text      id:user-name         ${USERNAME}
    Input Password  id:password          ${PASSWORD}
    Click Button    id:login-button