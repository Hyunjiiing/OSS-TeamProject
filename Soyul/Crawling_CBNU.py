from bs4 import BeautifulSoup as bs
import requests
import json
from firebase_admin import credentials
import sys
import io

sys.stdout = io.TextIOWrapper(sys.stdout.detach(), encoding = 'utf-8')
sys.stderr = io.TextIOWrapper(sys.stderr.detach(), encoding='utf-8')

# result={'title':[], 'date':[], 'link':[]}

url='' 

res=requests.get(url) #목표로 하는 웹페이지의 html을 requests 패키지를 이용하며 받아 옴

soup=bs(res.text,"lxml") #가져온 html 문서 전체를 beautifulsoup4 패키지를 이용하여 파싱(parsing)함

cbnu=soup.find_all("td",attrs={"class":"title"})

for i in cbnu:
    title=i.a.get_text()
    link=i.a["href"]
    print(title)

time=soup.find_all("td",attrs={"class":"time"})

for i in time:
    date=i.get_text()
    print(date)