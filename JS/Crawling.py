from urllib.request import urlopen
from bs4 import BeautifulSoup
i = 1

html = urlopen("https://www.chungbuk.ac.kr/site/www/boardList.do?boardSeq=112&key=698")
bs0bject = BeautifulSoup(html, "html.parser")

with open("C:\study\Test.txt", "w") as file:
    for anchor in bs0bject.select("td.subject"):
        URL = (str(i) + str(" : ") + anchor.text.strip(), anchor.a['href'])
        i = i + 1
        file.write(str(URL)+str("\n"))




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