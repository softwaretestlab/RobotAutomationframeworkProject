from selenium import webdriver
from selenium.webdriver.common.by import By

from utilities import ConfigReader

def before_scenario(context,driver):


    browser_name = ConfigReader.read_configuration("basic info","browser")


    if browser_name.__eq__("chrome"):
        context.driver = webdriver.Chrome()
    elif browser_name.__eq__("firefox"):
        context.driver = webdriver.Firefox()


    context.driver.maximize_window()
#    context.driver.get("https://www.saucedemo.com/")
    context.driver.get(ConfigReader.read_configuration("basic info","url"))
    context.driver.find_element(By.ID, "user-name").send_keys("standard_user")
    context.driver.find_element(By.ID, "password").send_keys("secret_sauce")
    context.driver.find_element(By.ID, "login-button").click()
    assert context.driver.find_element(By.XPATH, "//*[contains(text(),'Products')]").is_displayed()

# def after_scenario(context,driver):
#     context.driver.quit()