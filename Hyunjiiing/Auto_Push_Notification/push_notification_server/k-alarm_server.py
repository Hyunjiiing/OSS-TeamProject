print("=== Server Initializing... ===")
from bs4 import BeautifulSoup
import requests

from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time
from firebase_admin import firestore
import firebase_admin
from firebase_admin import credentials
from firebase_admin import messaging

browser = webdriver.Chrome(ChromeDriverManager().install())
print("=== Chromium install... ===")

cred = credentials.Certificate("keunalarm-sample-1-firebase-adminsdk-pp1xh-010c6445b5.json")
firebase_admin.initialize_app(cred)
db = firestore.client()


def notification(title):
    ref = db.collection('messeges')
    docs = ref.get()
    for doc in docs:
        message = messaging.Message(
            notification=messaging.Notification(
            title= "새로운 공지가 올라왔습니다",
            body= title,
        ),
        token = doc.to_dict()['Token'],
        )
        result = messaging.send(message)
    print(result)
    print("=== notification send! ===")
    
    
def Crawling():
    users_ref = db.collection('sw7up')
    users_ref = users_ref.order_by('date')
    docs = users_ref.get()
    isNew = False
    top=docs[-1].to_dict()["title"] 
    res = {'title': [], 'date': [], 'url': []}
    count = len(docs)
    
    for i in range(1, 3):
        page = f"https://sw7up.cbnu.ac.kr/community/notice?page={i}&limit=10&sort=-createdAt"
        html = requests.get(page).text
        bsObject = BeautifulSoup(html, "html.parser")
        
        for page_index in range(10):
            link = bsObject.find_all('span', 'mb-0')[page_index]
            title = str(link).split('>')[1].split('<')[0]
            if(title==top):
                if(isNew):
                    store_new_data(res, count)
                return isNew
            print(str(link).split('>')[1].split('<')[0])
            isNew = True
            res['title'].append(title)
            
            
                        
            link = bsObject.find_all('small')[2::3][page_index]
            print(str(link).split('>')[1].split('.<')[0])
            res['date'].append(str(link).split('>')[1].split('.<')[0])
            browser.get(page)
            elem = browser.find_elements(By.CLASS_NAME, 'card')
            elem[i].click()
            browser.implicitly_wait(10) 
            
            res['url'].append(browser.current_url)
            browser.back()
            browser.implicitly_wait(10) 
            
            notification(title)
            
# 새로운 공지 저장
def store_new_data(res, count):
    for i in range(len(res)-1,-1,-1):
        doc_ref = db.collection(u'sw7up').document(u'%04d' % count)
        doc_ref.set({'title': res['title'][i], 
        'date': res['date'][i],
        'url': res['url'][i]})
        count+=1
            
            
               
def main():
    Crawling()
         
if __name__ == "__main__":
	main()            
