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

#작성일
date=[]
x=0
for i in date_raw:
    raw=i.get_text()
    date.append(clean_text(raw))

print(date[11])
x=x+5

title=[]
#제목
for i in cbnu_raw:
    title_raw=i.get_text()
    title.append(clean_text(title_raw))

print(title)

#링크
link=[]
for i in cbnu_raw:
    link_raw=i.a["href"]
    link_raw=link_raw[1:]
    link.append(link_raw)

for i in link:
    print("https://www.chungbuk.ac.kr/site/www"+i)

