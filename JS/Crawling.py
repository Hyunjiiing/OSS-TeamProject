from urllib.request import urlopen
from bs4 import BeautifulSoup
from array import array #배열 선언
import re

from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time

import firebase_admin
from firebase_admin import credentials

cred = credentials.Certificate("")
firebase_admin.initialize_app(cred)

from firebase_admin import firestore


i = 1
#rows, cols = 200, 200
#arr = [[0 for j in range(cols)] for i in range(rows)] 

html = urlopen("https://www.chungbuk.ac.kr/site/www/boardList.do?boardSeq=112&key=698")
bs0bject = BeautifulSoup(html, "html.parser")

with open("E:\Study_folder\Test.txt", "w") as file:
    for link in bs0bject.body.select("td"):
        tr_text = link.text.strip()
        file.write(str(tr_text) + str("\n"))
        #print(str(tr_text))

j = 0
f = open("E:\Study_folder\Test.txt", "r")
data = str(f.read().split())
print(data)
f.close()

db = firestore.client()

res = {'title': [], 'date': [], 'url': []}

#with open("E:\Study_folder\Test.txt", "w") as file:
for anchor in bs0bject.body.select("td.subject"):
    Text = str(str(i) + str(": ") + anchor.text.strip())
    res['title'].append(Text)
    i = i + 1
    URL = str(anchor.a['href'].strip())
    res['url'].append(URL)
    print(str(Text) + str("\n") + str(URL) + str("\n"))
    
for size in range(i):
    doc_ref = db.collection(u'Notice').document(u'%d' % size)
    doc_ref.set({'title': res['title'][i], 
                'url': res['url'][i]})

        ##Writer = (bs0bject.tbody.select("span", {"style":"white-space:nowrap;"}).strip())
        ##re_URL = URL.repalce("a","b",10) #문자열 값 제거하는 건데 이미 strip를 사용하여 쓸모가 없음
#        file.write(str(Text) + str("\n") + str(URL) + str("\n"))


##URL 링크 들어가서 값을 추출하는 코드 & 현재는 필요 없는 것으로 판정
#html = urlopen("https://www.chungbuk.ac.kr/site/www/boardView.do?post=3210602&page=&boardSeq=112&key=698")
#bs0bject = BeautifulSoup(html, "html.parser")

#for Date in bs0bject.body.find("span",{"class":"board_dot small"}):
#        print(Date.text.strip())

#for meta in bs0bject.body.select("td",{"colspan":"2"}):
#        print(meta.text.strip())


#데이터 추가



