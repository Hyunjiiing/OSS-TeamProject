from bs4 import BeautifulSoup as bs
import requests
import json
from firebase_admin import credentials
import sys
import io
import re #정규표현식으로 없애고 dict에 넣어 #탭 없으면 그대로니까 경우 나눌 필요 없다.

sys.stdout = io.TextIOWrapper(sys.stdout.detach(), encoding = 'utf-8')
sys.stderr = io.TextIOWrapper(sys.stderr.detach(), encoding='utf-8')

# result={'title':[], 'date':[], 'link':[]}

# def clean_text(text):
#     cleaned_text = re.sub('[a-zA-Z]', '', text)
#     cleaned_text = re.sub('[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]',
#                           '', cleaned_text)
#     return cleaned_text

def clean_text(text):
    cleaned_text = re.sub(r'[\t]', '', text)
    return cleaned_text

for page_num in range(3):
    url=f'https://ece.cbnu.ac.kr/index.php?mid=ece0602&page={page_num+1}' 
    res=requests.get(url) #목표로 하는 웹페이지의 html을 requests 패키지를 이용하며 받아 옴

    soup=bs(res.text,"lxml") #가져온 html 문서 전체를 beautifulsoup4 패키지를 이용하여 파싱(parsing)함

    ece=soup.find_all("td",attrs={"class":"title"})

    for i in ece:
        title_semi=i.a.get_text()
        title=clean_text(title_semi)
        link=i.a["href"]
        print(title) #'특수문자 제거하는 법' 검색
        # print(link)

    time=soup.find_all("td",attrs={"class":"time"})

    for i in time:
        date=i.get_text()
        # print(date)


# url='https://ece.cbnu.ac.kr/index.php?mid=ece0602&page=1' 

# res=requests.get(url) #목표로 하는 웹페이지의 html을 requests 패키지를 이용하며 받아 옴

# soup=bs(res.text,"lxml") #가져온 html 문서 전체를 beautifulsoup4 패키지를 이용하여 파싱(parsing)함

# ece=soup.find_all("td",attrs={"class":"title"})

# for i in ece:
#     title=i.a.get_text()
#     link=i.a["href"]
#     print(title)
#     print(link)

# time=soup.find_all("td",attrs={"class":"time"})

# for i in time:
#     date=i.get_text()
#     print(date)