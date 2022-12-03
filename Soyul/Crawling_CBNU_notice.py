from urllib.request import urlopen
from array import array
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
for page_num in range(3):
    url=f"https://www.chungbuk.ac.kr/site/www/boardList.do?page={1+page_num}&boardSeq=112&key=698"
    res=requests.get(url)
    soup = bs(res.text, "lxml")

    date_raw=soup.body.select("td")
    cbnu_raw=soup.body.select("td.subject")

    #작성일
    for i in date_raw:
        date.append(str(i.text.strip()))

    #제목
    for i in cbnu_raw:
        title.append(str(i.text.strip()))

    #링크
    link_semi=[]
    for i in cbnu_raw:
        link_semi=i.a["href"]
        link_semi=link_semi[1:]
        link.append("https://www.chungbuk.ac.kr/site/www"+link_semi)

import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
from firebase_admin import firestore

# #firebase_database 인징 및 앱 초기화
# cred = credentials.Certificate("keunalarm-sample-1-firebase-adminsdk-pp1xh-2693095a20.json")
# firebase_admin.initialize_app(cred)
# db = firestore.client()

# for j in range(0, i):
#     doc_ref = db.collection(u'Notice').document(u'%d' % j)
#     doc_ref.set({u'title': res['title'][j], u'date' : date[5+6*i], u'url': res['url'][j]})
