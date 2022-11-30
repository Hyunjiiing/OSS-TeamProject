from bs4 import BeautifulSoup as bs
import requests
import json
import sys
import io
import re #정규표현식으로 없애고 dict에 넣자 #탭이 있는 것과 없는 것. 경우 나눠야 하는가? #탭 없으면 그대로니까 경우 나눌 필요 없다.

#인코딩(한글 깨짐 문제 해결)
sys.stdout = io.TextIOWrapper(sys.stdout.detach(), encoding = 'utf-8')
sys.stderr = io.TextIOWrapper(sys.stderr.detach(), encoding='utf-8')

#data 담을 dictionary 선언
result={'title':[], 'date':[], 'link':[]}

#탭 제거하는 함수(정규표현식 사용)
def clean_text(text):
    cleaned_text = re.sub(r'[\t]', '', text)
    return cleaned_text

#크롤링한 data를 dictionary에 append
for page_num in range(3):
    url=f'https://ece.cbnu.ac.kr/index.php?mid=ece0602&page={page_num+1}' 
    res=requests.get(url) #목표로 하는 웹페이지의 html을 requests 패키지를 이용하며 받아 옴

    soup=bs(res.text,"lxml") #가져온 html 문서 전체를 beautifulsoup4 패키지를 이용하여 파싱(parsing)함

    ece=soup.find_all("td",attrs={"class":"title"})

    for i in ece:
        title_semi=i.a.get_text()
        title_real=clean_text(title_semi)
        url=i.a["href"]
        result['title'].append(title_real) 
        #Problem: title 앞에 탭이 함께 출력되는 경우 존재 
        #Solution: '특수문자 제거하는 법' 검색하기 => 정규표현식 사용해 clean_text 함수 만들었다.
        result['link'].append(url)

    time=soup.find_all("td",attrs={"class":"time"})

    for i in time:
        date_semi=i.get_text()
        result['date'].append(date_semi)


#firebase 연동 및 data 업로드
import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
from firebase_admin import firestore

cred = credentials.Certificate("C:/firebase/key.json") #[Errno 2] No such file or directory => 이 부분에서 이러한 에러 발생
firebase_admin.initialize_app(cred)

firebase_database = firestore.client()

for i in range(len(result['title'])):
    document=firebase_database.collection('ECE_notice').document('no.%d'%i)
    document.set({
        "title":result['title'][i],
        "link":result['link'][i],
        "date":result['date'][i],
    })

