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

date=[]
title=[]
link=[]

for page_num in range(91):
    url=f'https://www.chungbuk.ac.kr/site/www/boardList.do?page={page_num+1}&boardSeq=113&key=699' 
    res=requests.get(url) 

    soup=bs(res.text,"html.parser")

    date_raw=soup.body.select("td")
    cbnu_raw=soup.body.select("td.subject")

    #작성일
    for i in date_raw:
        raw=i.get_text()
        date.append(clean_text(raw))

    #제목
    for i in cbnu_raw:
        title_raw=i.get_text()
        title.append(clean_text(title_raw))

    #링크
    for i in cbnu_raw:
        link_raw=i.a["href"]
        link_raw=link_raw[1:]
        link.append("https://www.chungbuk.ac.kr/site/www"+link_raw)


import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
from firebase_admin import firestore

cred = credentials.Certificate("C:/firebase/key.json")

firebase_admin.initialize_app(cred)

firebase_database = firestore.client()

for i in range(len(title)):
    document=firebase_database.collection('CBNU_scholarship').document('no.%d'%i)
    document.set({
        "title":title[i],
        "link":link[i],
        "date":date[5+6*i],
    })