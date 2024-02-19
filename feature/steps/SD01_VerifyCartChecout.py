from time import sleep

from behave import *
from selenium import webdriver
from selenium.webdriver.common.by import *


@given(u'user on Products page')
def step_impl(context):
    ItemName= context.driver.find_element(By.XPATH,"//*[contains(text(),'Sauce Labs Backpack')]").text
    assert ItemName=="Sauce Labs Backpack"


@then(u'add a product to cart')
def step_impl(context):
    context.driver.find_element(By.ID,"add-to-cart-sauce-labs-backpack").click()


@then(u'verify one product added to cart')
def step_impl(context):
    AddToCart=context.driver.find_element(By.XPATH,"//*[@class='shopping_cart_badge']").text
    assert AddToCart == "1 "
