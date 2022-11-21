from bs4 import BeautifulSoup as bs
import requests
import json
from firebase_admin import credentials

res={'title':[], 'date':[], 'link':[]}

url='https://ece.cbnu.ac.kr/ece0602'

html=requests.get(url)

soup=bs(html.text,'html.parser')