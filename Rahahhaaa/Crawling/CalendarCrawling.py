import requests
from bs4 import BeautifulSoup
import datetime
date_format = '%Y.%m.%d.'

res_undergraduate = {'start_date' : [], 'content' : []}
res_graduate = {'start_date' : [], 'content' : []}

def slicing(s, mode):
    res_undergraduate['content'].append(s)
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
        print(start_date)
        dt = datetime.datetime.strptime(start_date,date_format)
        res_undergraduate['start_date'].append(dt)
        
    else:
        res_graduate['content'].append(s)
        if len(start_date) == 6:
            start_date = '2022.' + start_date
            if start_date[5] != 0:
                start_date = start_date[:5] + '0' + start_date[6:]
        elif len(start_date) <= 5:
            start_date = '2022.0' + start_date
        print(start_date)
        dt = datetime.datetime.strptime(start_date,date_format)
        res_graduate['start_date'].append(dt)
        
    

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

print(res_undergraduate['start_date'][0])
print(res_undergraduate['content'][0])

#파이어베이스 연동
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

cred = credentials.Certificate("")
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
