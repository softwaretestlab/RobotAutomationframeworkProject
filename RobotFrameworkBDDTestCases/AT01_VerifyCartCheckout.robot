*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           String
Library           SeleniumLibrary
Resource          ../resources/resource.robot

*** Variables ***
#${LOGIN_PAGE_URL}        https://www.saucedemo.com/
#${USERNAME}              standard_user
#${PASSWORD}              secret_sauce

*** Test Cases ***
AT01_VerifyCartCheckout.robot
    [Tags]  FunctionalTest
    Given user logs into SwagLabs
    Then Add's Product To Cart
    Then Click On Mini Cart
    And Compare Product Page And Cart Page
    Then Close Browser

*** Keywords ***
#Given user logs into SwagLabs
#    Open Browser    ${LOGIN_PAGE_URL}    chrome
#    Input Text      id:user-name         ${USERNAME}
#    Input Password  id:password          ${PASSWORD}
#    Click Button    id:login-button

Then Add's Product To Cart
    ${product_names}=    Get WebElements    xpath://*[@class='inventory_item_name ']
    ${product_amounts}=  Get WebElements    xpath://*[@class='inventory_item_price']
    ${add_to_cart}=     Get WebElements    xpath://button[contains(text(),'Add to cart')]

    ${size}=    Get Length    ${add_to_cart}
    ${index}=   Set Variable    0

    FOR    ${i}    IN RANGE    ${size}
        ${product_name}=    Get Text    ${product_names}[${i}]
        ${product_amount}=  Get Text    ${product_amounts}[${i}]
       ${product_amount} =    Replace String    ${product_amount}    $    ${EMPTY}  # Remove the $
       ${product_amount_numeric} =    Convert To Number    ${product_amount}
           Log To Console    Product Amount: ${product_amount_numeric}

        Set Suite Variable    ${product_name}
        Set Suite Variable    ${product_amount_numeric}


        Click Element    ${add_to_cart}[${i}]
        Exit For Loop
    END

Then Click On Mini Cart
    Click Element    xpath://span[@class='shopping_cart_badge']

And Compare Product Page And Cart Page
    ${added_product_name}=    Get Text    xpath://*[contains(text(),'Sauce Labs Backpack')]
    ${added_product_amount}=  Get Text    xpath://*[@class='inventory_item_price']
    ${added_product_amount1} =    Replace String    ${added_product_amount}    $    ${EMPTY}  # Remove the $
    ${added_product_amount2} =    Convert To Number    ${added_product_amount1}
    Log To Console    Product Amount: ${added_product_amount2}
    Should Be Equal As Strings    ${added_product_name}    ${product_name}
    Should Be Equal As Strings    ${added_product_amount2}  ${product_amount_numeric}