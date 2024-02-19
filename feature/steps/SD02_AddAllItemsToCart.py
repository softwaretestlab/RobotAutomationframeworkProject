import time
from time import sleep

from behave import *
from selenium import webdriver
from selenium.webdriver.common.by import *


@given(u'user adds all Products to cart')
def step_impl(context):
    assert context.driver.find_element(By.XPATH, "//*[contains(text(),'Products')]").is_displayed()
    for e in context.driver.find_elements(By.XPATH,"//*[contains(text(),'Add to cart')]"):
     e.click()


@then(u'clicks on mini cart and user get navigates to cart page')
def step_impl(context):
    context.driver.find_element(By.XPATH,"//*[@class='shopping_cart_badge']").click()


@then(u'user removes all products form cart page')
def step_impl(context):
    time.sleep(10)
    print("test")
    for e in context.driver.find_elements(By.XPATH, "//*[contains(text(),'Remove')]"):
        e.click()