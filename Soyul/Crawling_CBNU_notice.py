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


# #번호가 '공지'인 항목 개수 파악하기 위해 초기값 0으로 count 선언 
# count=0

# #첫페이지만 있어도 개수 파악 가능
# url_count="https://www.chungbuk.ac.kr/site/www/boardList.do?page=1&boardSeq=112&key=698"
# res_count=requests.get(url_count)
# soup_count=bs(res_count.text,"html.parser")

# #번호가 '공지'인 항목만의 특이점(html)
# count_raw=soup_count.body.select("em")

# #번호가 '공지'인 항목 개수 count
# for i in count_raw:
#     count=count+1


for page_num in range(2):
    url=f"https://www.chungbuk.ac.kr/site/www/boardList.do?page={1+page_num}&boardSeq=112&key=698"
    res=requests.get(url)
    soup = bs(res.text, "lxml")

    date_raw=soup.body.select("td")
    cbnu_raw=soup.body.select("td.subject")

    #작성일
    for i in date_raw:
        date.append(str(i.text.strip()))

    # date=date[count:] #slicing => 공지(중복) 제거하기


    #제목
    for i in cbnu_raw:
        title.append(str(i.text.strip()))

    # title=title[count:] #slicing => 공지(중복) 제거하기

    #링크
    link_semi=[]
    for i in cbnu_raw:
        link_semi=i.a["href"]
        link_semi=link_semi[1:]
        link.append("https://www.chungbuk.ac.kr/site/www"+link_semi)

    # link=link[count:] #slicing => 공지(중복) 제거하기

import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
from firebase_admin import firestore

cred = credentials.Certificate("C:/firebase/key.json")

firebase_admin.initialize_app(cred)

firebase_database = firestore.client()

for i in range(len(title)):
    document=firebase_database.collection('CBNU_notice').document('no.%d'%i)
    document.set({
        "title":title[i],
        "link":link[i],
        "date":date[5+6*i],
    })