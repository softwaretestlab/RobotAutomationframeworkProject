*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           OperatingSystem
Library           SeleniumLibrary
Resource          ../resources/resource.robot


*** Variables ***
#${LOGIN_PAGE_URL}        https://www.saucedemo.com/
#${USERNAME}              standard_user
#${PASSWORD}              secret_sauce


*** Test Cases ***
AT02_VerifyAddAllProductsNDelete
    [Tags]  FunctionalTest
    Given user logs into SwagLabs
    Then Add's All Items To Cart
    And Navigate To Cart Page
    Then Remove All Items And Verify Removal
    Then Close Browser


*** Keywords ***
#Given user Logins To Website
#    Open Browser    ${LOGIN_PAGE_URL}    chrome
#    Input Text      id:user-name         ${USERNAME}
#    Input Text      id:password          ${PASSWORD}
#    Click Button    id:login-button

Then Add's All Items To Cart
    ${add_to_cart_buttons}    Get WebElements    xpath=//button[contains(text(),'Add to cart')]
    FOR    ${button}    IN    @{add_to_cart_buttons}
        Click Element    ${button}
    END

And Navigate To Cart Page
    Click Element    xpath=//span[@class='shopping_cart_badge']

Then Remove All Items And Verify Removal
    ${remove_buttons}    Get WebElements    xpath=//*[@class='btn btn_secondary btn_small cart_button']
    FOR    ${button}    IN    @{remove_buttons}
        Click Element    ${button}
    END

    # Verify that the cart is empty
    ${cart_badge}    Get WebElements    xpath=//*[@class='shopping_cart_badge']
    Should Be Empty    ${cart_badge}