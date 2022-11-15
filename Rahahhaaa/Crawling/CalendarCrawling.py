import requests
from bs4 import BeautifulSoup

res_undergraduate = {'start_date' : [], 'content' : []}
res_graduate = {'start_date' : [], 'content' : []}

def slicing(s, mode):
    s = s.split(']')
    s[0] = s[0].split('~')
    if mode == 0 :    
        res_undergraduate['start_date'].append(s[0][0].split('[')[1])
        res_undergraduate['content'].append(s[1])
    else:
        res_graduate['start_date'].append(s[0][0].split('[')[1])
        res_graduate['content'].append(s[1])
    

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

cred = credentials.Certificate("C:/Users/airli/Desktop/OSS프로젝트/크롤링/keunalarm-sample-1-firebase-adminsdk-pp1xh-11efc3b1b8.json")
firebase_admin.initialize_app(cred)
firebase_db = firestore.client()

for i in range(len(res_undergraduate['start_date'])):
    doc = firebase_db.collection('Calendar_undergraduate').document(u'undergraduate%d'%i)
    doc.set({"start_date":res_undergraduate['start_date'][i],
             "content":res_undergraduate['content'][i]})

for i in range(len(res_graduate['start_date'])):
    doc = firebase_db.collection('Calendar_graduate').document(u'graduate%d'%i)
    doc.set({"start_date":res_graduate['start_date'][i],
             "content":res_graduate['content'][i]})
