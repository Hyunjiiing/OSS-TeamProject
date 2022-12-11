import requests
from bs4 import BeautifulSoup
import datetime
date_format = '%Y.%m.%d.'

res_undergraduate_date = []
res_graduate_date = []
res_undergraduate_content = []
res_graduate_content = []

def slicing(s, mode):
    content = s[:]
    s = s.split(']')
    s[0] = s[0].split('~')
    start_date = s[0][0].split('[')[1].split('(')[0]
    if start_date[-1] != '.':
        start_date = start_date + '.'
        
    if mode == 0 :
        if len(start_date) == 6:
            start_date = '2022.' + start_date
            
        elif len(start_date) <= 5:
            start_date = '2022.0' + start_date
        dt = datetime.datetime.strptime(start_date,date_format)
        res_undergraduate_date.append(dt)
        res_undergraduate_content.append(content)
        
    else:
        if len(start_date) == 6:
            start_date = '2022.' + start_date
            if start_date[5] == ' ':
                start_date = start_date[:5] + '0' + start_date[6:]
        elif len(start_date) <= 5:
            start_date = '2022.0' + start_date
        dt = datetime.datetime.strptime(start_date,date_format)
        res_graduate_date.append(dt)
        res_graduate_content.append(content)
        
    

url = 'https://www.chungbuk.ac.kr/site/www/sub.do?key=1853'
headers = {'User->Agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36'}
res = requests.get(url, headers)
soup = BeautifulSoup(res.content, 'lxml')

data = soup.select('div.schedule')

count = 0
mode = 0
for item in data:
    string = item.text.splitlines()
    for text in string:
        if text == "학부 학사일정":
            mode = 0
        elif text == "대학원 학사일정":
            mode = 1
        elif text != '':
            slicing(text, mode)



#파이어베이스 연동
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

cred = credentials.Certificate("")
firebase_admin.initialize_app(cred)
firebase_db = firestore.client()

for i in range(len(res_undergraduate_date)):
    doc = firebase_db.collection('Calendar_undergraduate').document(u'undergraduate%d'%i)
    doc.set({"start_date":res_undergraduate_date[i],"content":res_undergraduate_content[i]})

for i in range(len(res_graduate_date)):
    doc = firebase_db.collection('Calendar_graduate').document(u'graduate%d'%i)
    doc.set({"start_date":res_graduate_date[i],"content":res_graduate_content[i]})

#collection 하나로 저장하기(구분방식: 대학원datetime 0초/학부datetime1초/학부 문자열 앞에*)
for i in range(len(res_undergraduate_date)):
    res_undergraduate_date[i] = res_undergraduate_date[i] + datetime.timedelta(seconds=1)

for i in range(len(res_undergraduate_date)):
    doc = firebase_db.collection('Calendar').document(u'undergraduate%d'%i)
    res_undergraduate_content[i] = "*" + res_undergraduate_content[i] 
    doc.set({"start_date":res_undergraduate_date[i],"content":res_undergraduate_content[i]})

for i in range(len(res_graduate_date)):
    doc = firebase_db.collection('Calendar').document(u'graduate%d'%i)
    doc.set({"start_date":res_graduate_date[i],"content":res_graduate_content[i]})
