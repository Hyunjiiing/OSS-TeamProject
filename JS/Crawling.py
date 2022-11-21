from urllib.request import urlopen
from bs4 import BeautifulSoup
import re

i = 1

html = urlopen("https://www.chungbuk.ac.kr/site/www/boardList.do?boardSeq=112&key=698")
bs0bject = BeautifulSoup(html, "html.parser")

with open("E:\Study_folder\Test.txt", "w") as file:
    for anchor in bs0bject.body.select("td.subject"):
        Text = (str(i) + str(": ") + anchor.text.strip())
        URL = (anchor.a['href'].strip())
        #Writer = (bs0bject.tbody.select("span", {"style":"white-space:nowrap;"}).strip())
       ## re_URL = URL.repalce("a","b",10) #문자열 값 제거하는 건데 이미 strip를 사용하여 쓸모가 없음
        i = i + 1
        print(str(Text) + str("\n") + str(URL))
        file.write(str(Text) + str("\n") + str(URL))

html = urlopen("https://www.chungbuk.ac.kr/site/www/boardView.do?post=3210602&page=&boardSeq=112&key=698")
bs0bject = BeautifulSoup(html, "html.parser")

with open("E:\Study_folder\Test2.txt", "w") as file:
    for Date in bs0bject.body.find("span",{"class":"board_dot small"}):
        print(Date.text.strip())

    for meta in bs0bject.body.select("td",{"colspan":"2"}):
        print(meta.text.strip())



#import firebase_admin
#from firebase_admin import credentials
#from firebase_admin import db
 
#Firebase database 인증 및 앱 초기화
#cred = credentials.Certificate("path/to/serviceAccountKey.json")
#firebase_admin.initialize_app(cred)
 
#dir = db.reference() #기본 위치 지정
#dir.update({'URL'})

#dir = db.reference() #기본 위치 지정
#print(dir.get())
 
#dir = db.reference('')
#print(dir.get())
