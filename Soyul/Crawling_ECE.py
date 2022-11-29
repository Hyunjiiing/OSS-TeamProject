from bs4 import BeautifulSoup as bs
import requests
import json
from firebase_admin import credentials
import sys
import io
import re

sys.stdout = io.TextIOWrapper(sys.stdout.detach(), encoding = 'utf-8')
sys.stderr = io.TextIOWrapper(sys.stderr.detach(), encoding='utf-8')

result={'title':[], 'date':[], 'link':[]}

def clean_text(text):
    cleaned_text = re.sub('[a-zA-Z]', '', text)
    cleaned_text = re.sub('[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]',
                          '', cleaned_text)
    return cleaned_text

result_title = []
result_time = []

special_char = '\n\t'
for page in range(24):
    url = f"https://ece.cbnu.ac.kr/index.php?mid=ece0602&page={page+1}"
    res = requests.get(url)
    soup = BeautifulSoup(res.text, 'html.parser')
    for content in soup.select('td > a'):
        # print(content.getText('title'))
        result_title.append(content.getText('title').replace('\t\n', ''))

    for content in soup.select('td.time'):
        # print(content.getText('16:24'))
        result_time.append(content.getText('16:24'))


print(result_time)
print(result_title)

# t=[]
# d=[]
# l=[]
# hrefs=[]

# url='https://ece.cbnu.ac.kr/index.php?mid=ece0602&page=1' 

# response=requests.get(url) #목표로 하는 웹페이지의 html을 requests 패키지를 이용하며 받아 옴

# html=bs(response.text,'html.parser') #가져온 html 문서 전체를 beautifulsoup4 패키지를 이용하여 파싱(parsing)함

# t.append(html.find_all(class_='hx'))

# d.append(html.find_all(class_='time'))

# l.append(html.find_all('a')) #href를 넣어서 쓰기

# print(t)
# print(d)
# print(l)

