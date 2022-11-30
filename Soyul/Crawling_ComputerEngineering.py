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

url='https://computer.chungbuk.ac.kr/bbs/bbs.php?db=notice&search=&searchKey=&category=0&pgID=ID12415888101&page=1' 
res=requests.get(url) 

soup=bs(res.text,"html.parser")

date_raw=soup.body.select("td.body_num")
cbnu_raw=soup.body.select("td.body_bold")

#작성일
for i in date_raw:
    raw=i.get_text()
    date.append(clean_text(raw))

#제목
for i in cbnu_raw:
    title_raw=i.a.get_text()
    title.append(clean_text(title_raw))

#링크
for i in cbnu_raw:
    link_raw=i.a["href"]
    link_raw=link_raw[1:]
    link.append("https://computer.chungbuk.ac.kr/"+link_raw)

print(date)
print(link)
print(title)