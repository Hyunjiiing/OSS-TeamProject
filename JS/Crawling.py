from urllib.request import urlopen
from bs4 import BeautifulSoup
from array import array
res = {'title': [], 'url': []}
tr_text = {'data':[]}
i = 0
j = 0
z = 5
html = urlopen("https://www.chungbuk.ac.kr/site/www/boardList.do?boardSeq=112&key=698")
bs0bject = BeautifulSoup(html, "html.parser")

for link in bs0bject.body.select("td"):
    tr_text['data'].append(str(link.text.strip()))

for anchor in bs0bject.body.select("td.subject"):
    res['title'].append(str(anchor.text.strip()))
    res['url'].append(str(anchor.a['href'].strip()))
    i = i + 1
    
import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
from firebase_admin import firestore

#firebase_database 인징 및 앱 초기화
cred = credentials.Certificate("keunalarm-sample-1-firebase-adminsdk-pp1xh-2693095a20.json")
firebase_admin.initialize_app(cred)
db = firestore.client()

for j in range(0, i):
    doc_ref = db.collection(u'Notice').document(u'%d' % j)
    doc_ref.set({u'title': res['title'][j], u'date' : tr_text['data'][z], u'url': res['url'][j]})
    z = z + 6