import requests
from bs4 import BeautifulSoup
import re
from geopy.geocoders import Nominatim
import time

page = "http://www.wholefoodsmarket.com/stores/list?address=&field_geo_data_latlon[radius]=1000000&field_geo_data_latlon[lat]=1&field_geo_data_latlon[lng]=1&page="
coords = []
addresses = []

for n in range(1, 93):
    url = page + str(n)
    r  = requests.get(url)
    data = r.text
    soup = BeautifulSoup(data)
    streets  = soup.findAll("div", { "class" : "thoroughfare" })
    cities = soup.findAll("span", { "class" : "locality" })
    states = soup.findAll("span", { "class" : "state" })
    zips = soup.findAll("span", { "class" : "postal-code" })
        
    streetNames = []
    cityNames = []
    stateNames = []
    zipNames = []

    for i in streets:
        street = str(i)
        b = re.findall(r'>(.*)<', street)
        b = str(b)
        b = b.replace("['", "")
        b = b.replace("']", "")
        streetNames.append(b)
        
    for j in cities: 
        city = str(j)
        c = re.findall(r'>(.*)<', city)
        c = str(c)
        c = c.replace("['", "")
        c = c.replace("']", "")
        cityNames.append(c)

    for k in states: 
        state = str(k)
        d = re.findall(r'>(.*)<', state)
        d = str(d)
        d = d.replace("['", "")
        d = d.replace("']", "")
        stateNames.append(d)    
        
    for k in zips: 
        zip = str(k)
        e = re.findall(r'>(.*)<', zip)
        e = str(e)
        e = e.replace("['", "")
        e = e.replace("']", "")
        zipNames.append(e)        
        
    length = len(states)
    
    for m in range(0, length):
        addr = streetNames[m] + " " + cityNames[m]  + " " + stateNames[m] + " " + zipNames[m]      
        z = streetNames[m] + " " + cityNames[m]
        addresses.append(z)

    time.sleep(1)
        
count = 0

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
    
  
    

    
    