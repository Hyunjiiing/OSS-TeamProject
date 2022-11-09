import requests
from bs4 import BeautifulSoup

undergraduate_schedule = []
graduate_schedule = []

undergraduate_schedule_date = []
graduate_schedule_date = []

url = 'https://www.chungbuk.ac.kr/site/www/sub.do?key=1853'
headers = {'User->Agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36'}
res = requests.get(url, headers)
soup = BeautifulSoup(res.content, 'lxml')

data = soup.select('div.schedule')


for item in data:
    print(item.get_text())

#슬라이싱해야됨
