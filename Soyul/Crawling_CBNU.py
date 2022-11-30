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

url='https://www.chungbuk.ac.kr/site/www/boardList.do?page=1&boardSeq=113&key=699' 
res=requests.get(url) 

soup=bs(res.text,"html.parser")

date_raw=soup.body.select("td")
cbnu_raw=soup.body.select("td.subject")

#날짜
# date=[]
# x=0
# for i in date_raw:
#     raw=i.get_text()
#     date.append(clean_text(raw))

# print(date[11])
# x=x+5

# title=[]
# #공지사항 제목
# for i in cbnu_raw:
#     title_raw=i.get_text()
#     title.append(clean_text(title_raw))

# print(title)

#공지사항 링크
link=[]
for i in cbnu_raw:
    link_raw=i.a["href"]
    link_raw=link_raw[1:]
    link.append(link_raw)

for i in link:
    print("https://www.chungbuk.ac.kr/site/www"+i)





# link=cbnu_raw.a["href"]
# title=cbnu_raw.text

# def clean_text(text):
#     cleaned_text = re.sub(r'[\t]', '', text)
#     return cleaned_text

# for page_num in range(3):
#     url=f'https://ece.cbnu.ac.kr/index.php?mid=ece0602&page={page_num+1}' 
#     res=requests.get(url) #목표로 하는 웹페이지의 html을 requests 패키지를 이용하며 받아 옴

#     soup=bs(res.text,"lxml") #가져온 html 문서 전체를 beautifulsoup4 패키지를 이용하여 파싱(parsing)함

#     ece=soup.find_all("td",attrs={"class":"title"})

#     for i in ece:
#         title_semi=i.a.get_text()
#         title_real=clean_text(title_semi)
#         url=i.a["href"]
#         result['title'].append(title_real) 
#         #Problem: title 앞에 탭이 함께 출력되는 경우 존재 
#         #Solution: '특수문자 제거하는 법' 검색하기 => 정규표현식 사용해 clean_text 함수 만들었다.
#         result['link'].append(url)

#     time=soup.find_all("td",attrs={"class":"time"})

#     for i in time:
#         date_semi=i.get_text()
#         result['date'].append(date_semi)


# import firebase_admin
# from firebase_admin import credentials
# from firebase_admin import db
# from firebase_admin import firestore

# cred = credentials.Certificate("C:/firebase/key.json") #[Errno 2] No such file or directory => 이 부분에서 이러한 에러 발생

# firebase_admin.initialize_app(cred)

# firebase_database = firestore.client()

# for i in range(len(result['title'])):
#     document=firebase_database.collection('ECE_notice').document('no.%d'%i)
#     document.set({
#         "title":result['title'][i],
#         "link":result['link'][i],
#         "date":result['date'][i],
#     })

