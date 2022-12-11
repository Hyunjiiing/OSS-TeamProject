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

for page_num in range(11):
    url=f'https://computer.chungbuk.ac.kr/bbs/bbs.php?db=notice&search=&searchKey=&category=0&pgID=ID12415888101&page={page_num+1}' 
    res=requests.get(url) 

    soup=bs(res.text,"html.parser")

    date_raw=soup.body.select("td.body_num")
    cbnu_raw=soup.body.select("td.body_bold")

    #작성일
    for i in date_raw:
        raw=i.get_text()
        date.append(clean_text(raw))


    #제목
    for i in cbnu_raw:
        title_raw=i.a.get_text()
        title.append(clean_text(title_raw))

    #링크
    for i in cbnu_raw:
        link_raw=i.a["href"]
        link_raw=link_raw[1:]
        link.append("https://computer.chungbuk.ac.kr/"+link_raw)



#작성일 형식 바꾸기(yyyy-mm-dd => yyyy.mm.dd)
date_real=[] # 날짜만 담기
date_default=[] #형식 변환한 data 담기(yyyy-mm-dd => yyyy.mm.dd)

for i in range(len(title)):
    date_real.append(date[2+4*i])

for i in date_real:
    table=str.maketrans('-','.')
    i=i.translate(table)
    date_default.append(i)



import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
from firebase_admin import firestore

cred = credentials.Certificate("C:/firebase/key.json")

firebase_admin.initialize_app(cred)

firebase_database = firestore.client()

for i in range(len(title)):
    document=firebase_database.collection('ComputerEngineering_notice').document('%s'%str(i).zfill(4))
    document.set({
        "title":title[i],
        "link":link[i],
        "date":date_default[i],
    })