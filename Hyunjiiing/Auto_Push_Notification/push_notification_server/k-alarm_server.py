print("=== Server Initializing... ===")
from bs4 import BeautifulSoup
import requests

from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time
from firebase_admin import firestore
import firebase_admin
from firebase_admin import credentials
from firebase_admin import messaging

browser = webdriver.Chrome(ChromeDriverManager().install())
print("=== Chromium install... ===")

cred = credentials.Certificate("keunalarm-sample-1-firebase-adminsdk-pp1xh-010c6445b5.json")
firebase_admin.initialize_app(cred)
db = firestore.client()