from bs4 import BeautifulSoup as bs
import requests
import json
import sys
import io
import re 

sys.stdout = io.TextIOWrapper(sys.stdout.detach(), encoding = 'utf-8')
sys.stderr = io.TextIOWrapper(sys.stderr.detach(), encoding='utf-8')

def clean_text(text):
    cleaned_text = re.sub(r'[\t\n\r]', '', text)
    return cleaned_text

#번호가 '공지'인 항목 개수 파악하기 위해 count 선언(초기값 0)
count=0

url='https://www.chungbuk.ac.kr/site/www/boardList.do?page=1&boardSeq=113&key=699'
res=requests.get(url) 

soup=bs(res.text,"html.parser")

#번호가 '공지'인 항목만의 특이점(html)
count_raw=soup.body.select("em")

#번호가 '공지'인 항목 개수 count
for i in count_raw:
    count=count+1


final_title=[]
final_date=[]
final_link=[]

#여러페이지 크롤링
for page_num in range(28):
    url=f'https://www.chungbuk.ac.kr/site/www/boardList.do?page={page_num+1}&boardSeq=113&key=699'
    res=requests.get(url) 

    soup=bs(res.text,"html.parser")

    date_raw=soup.body.select("td")
    cbnu_raw=soup.body.select("td.subject")

    title=[]
    date=[]
    link=[]
    
    #제목
    for i in cbnu_raw:
        title_raw=i.get_text()
        title.append(clean_text(title_raw))

    #작성일
    for i in date_raw:
        raw=i.get_text()
        date.append(clean_text(raw))

    #작성일 data만 추출
    semi_date=[]
    for i in range(len(title)):
        semi_date.append(date[5+6*i])

    #slicing => 번호 '공지'(중복) 제거하기
    title=title[count:]
    semi_date=semi_date[count:]

    #번호 '공지'가 제거된 작성일 data => final_date에 넣기
    for i in range(len(semi_date)):
        final_date.append(semi_date[i])
    #Complete 작성일

    #번호 '공지'가 제거된 제목 data => final_title에 넣기
    for i in range(len(title)):
        final_title.append(title[i])
    #Complete 제목

    #링크
    for i in cbnu_raw:
        link_raw=i.a["href"]
        link_raw=link_raw[1:]
        link.append("https://www.chungbuk.ac.kr/site/www"+link_raw)
    link=link[count:]

    #번호 '공지'가 제거된 링크 data => final_link에 넣기
    for i in range(len(link)):
        final_link.append(link[i])
    #Complete 링크



import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
from firebase_admin import firestore

cred = credentials.Certificate("C:/firebase/key.json")

firebase_admin.initialize_app(cred)

firebase_database = firestore.client()

for i in range(len(final_title)):
    document=firebase_database.collection('CBNU_scholarship').document('%s'%str(i).zfill(4))
    document.set({
        "title":final_title[i],
        "link":final_link[i],
        "date":final_date[i],
    })