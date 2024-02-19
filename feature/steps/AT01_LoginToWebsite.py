from behave import *
from selenium import webdriver
from selenium.webdriver.common.by import *

@given(u'navigate to swaglab')
def launchWebsite(context):
    # context.driver = webdriver.Chrome()
    # context.driver.maximize_window();
    # context.driver.get("https://www.saucedemo.com/")
    ExpectedTitle="Swag Labs"
    assert context.driver.title.__eq__(ExpectedTitle)



@then(u'Enter username')
def EnterUserName(context):
    context.driver.find_element(By.ID,"user-name").send_keys("standard_user")



@then(u'Enter Password')
def EnterPassword(context):
    context.driver.find_element(By.ID,"password").send_keys("secret_sauce")


@then(u'Click on login button')
def ClickSubmitBtn(context):
    context.driver.find_element(By.ID,"login-button").click()
    assert context.driver.find_element(By.XPATH,"//*[contains(text(),'Products')]").is_displayed()
