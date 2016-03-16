import csv
import numpy as numpy
#import panda as pd
with open ('/Users/moiz/Desktop/pre.csv','rU') as f:
	reader=csv.reader(f, delimiter=',')
	try:
		arr = [tuple(float(v) for v in row) for row in reader]
	except ValueError:
		print 'line {i} is corrupt',row
	# arr = zip(*arr)  # transpose rows and columns
	#arr_new=zip(*[iter(arr)]*6)
	#print arr[1]
	# arr=list[arr]
	# #for i in arr:
	# 	#value=i
	# 	#for x in xrange(0, len(arr), 2):
	# my_list=[]
	# with open ('/Users/moiz/Desktop/post.csv','rU') as f:	
	# 	for i in range (0,28): #no of coloumns
	# 		chunk=[]
	# 		chunk=zip(*[iter(arr[i])]*6) 
	# 		for j in range (0,540): #no of sets you can make in 100
	# 			val=chunk[j]
	# 			try:
	# 				new_val=(val[0]+val[1]+val[2]+val[3]+val[4]+val[5])/6
	# 				break
	# 			except ZeroDivisionError:
	# 				print 'hello'
				# 	new_val=0
				# my_list.append(new_val)


# new = []
# for i in range(0, len(my_list), 540): 
# 	new.append(my_list[i : i+540])

# new = zip(*new)
# with open ('/Users/moiz/Desktop/post.csv','w') as f:
# 	writer=csv.writer(f)
# 	writer.writerows(new)
# 	