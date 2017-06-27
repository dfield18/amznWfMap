import requests
from bs4 import BeautifulSoup
import re
import geopy
from geopy.geocoders import Nominatim
import time
import geolocation
import pandas as pd

df = pd.read_csv('C:\Users\Mary\Documents\wholeFoods\North_America_Fulfillment_Centers.csv')
saved_column = df.location #you can also use df['column_name']    

count = 287

for a in addresses:
    url = 'https://maps.googleapis.com/maps/api/geocode/json'
    address = addresses[count]
    params = {'sensor': 'false', 'address': address}
    r = requests.get(url, params=params)       
    results = r.json()['results']
    location = results[0]['geometry']['location']   
    lat = location['lat']
    lon = location['lng']
    print(lat, " ", lon)
    count = count +1
    time.sleep(1)
    