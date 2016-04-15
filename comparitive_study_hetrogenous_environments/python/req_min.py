from collections import Counter
import codecs
import re
import csv
minutes = []
f=open(r'C:\Users\umroot\Desktop\test_04\access.log', 'r')
c=f.readline()
print(c)
for line in f:
    match = re.search('\d{2}:\d{2}:\d{2}\s',line)
    minutes.append(match.group()[:5])
    #print(minutes)
counter = Counter(minutes)
print(Counter(minutes))
with open(r'C:\Users\umroot\Desktop\reqmin.csv', 'w') as fp:
    a = csv.writer(fp, delimiter=',')
    for key, value in counter.items() :
        data = [[key,str(value)]]
        a.writerows(data)
