from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time

driver = webdriver.Chrome("C:/Users/airli/Desktop/OSS프로젝트/chromedriver_win32.chromedriver")
driver.get("https://www.chungbuk.ac.kr/site/www/sub.do?key=1804")
driver.implicitly_wait(3)
        
