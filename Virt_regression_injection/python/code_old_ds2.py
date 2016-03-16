import csv
import numpy as np
with open ('/Users/moiz/Desktop/pre.csv','rU') as f:
	reader=csv.reader(f)
	arr=[]
	for col in reader:
		arr.append(float(col[0]))

	with open('post.csv','w') as f:
		fn=['col0']
		writer=csv.DictWriter(f,fieldnames=fn)
		chunks=[arr[x:x+66] for x in xrange(0, len(arr), 66)]
		group = []
		for i in range(len(chunks)):
			grp=chunks[i]
			grp=grp[6:]
			group.append(grp)
		flat_group = []
		for x in range(len(group)):
			for y in range(len(group[x])):
				flat_group.append(group[x][y])
		avg = []
		unflattened_grp = zip(*[iter(flat_group)]*6)
		for z in range(len(unflattened_grp)):
			avrg = sum(unflattened_grp[z])/len(unflattened_grp[z])
			avg.append(avrg)
		for row in avg:
			writer.writerow({'col0':row})