from bs4 import BeautifulSoup
import requests
import pandas as pd
import sys
import io
import json
from firebase_admin import credentials

sys.stdout = io.TextIOWrapper(sys.stdout.detach(), encoding = 'utf-8')
sys.stderr = io.TextIOWrapper(sys.stderr.detach(), encoding='utf-8')

title_and_link_result = []
day = []

for page_num in range(3): #숫자-페이지수(전체 페이지수 420)

    url =f'https://www.chungbuk.ac.kr/site/www/boardList.do?page={page_num+1}&boardSeq=113&key=699'

    response = requests.get(url)

    soup = BeautifulSoup(response.text, 'html.parser')
    title_link = soup.select('div > div > div > div > form > table > tbody > tr > td > a  ')
    day = soup.select('div > div > div > div > form > table > tbody > tr > td ')

    for row in day:
        day.append(row)
    

    for row in title_link:
        title_and_link_result.append(row)



day_result = []
print(day[5])
for row in day:
    day_result.append(row[5])
    

print(title_and_link_result[0])
print(day_result)
