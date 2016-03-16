import csv
import numpy as numpy
#import panda as pd
with open ('/Users/moiz/Desktop/pre.csv','rU') as f:
	reader=csv.reader(f, delimiter=',')
	arr = [tuple(float(v) for v in row) for row in reader]
	arr = zip(*arr)  # transpose rows and columns
	#arr_new=zip(*[iter(arr)]*6)
	#print arr[1]
	# arr=list[arr]
	#for i in arr:
		#value=i
		#for x in xrange(0, len(arr), 2):
	my_list=[]
	with open ('/Users/moiz/Desktop/post.csv','rU') as f:	
		for i in range (0,28): #no of coloumns
			chunk=[]
			chunk=zip(*[iter(arr[i])]*6) 
			for j in range (0,540): #no of sets you can make in 100
				val=chunk[j]
				new_val=(val[0]+val[1]+val[2]+val[3]+val[4]+val[5])/6
				my_list.append(new_val)
#print my_list
# print ('------------------------ \n')
new = []
for i in range(0, len(my_list), 540): 
	new.append(my_list[i : i+540])

new = zip(*new)
#print new
with open ('/Users/moiz/Desktop/post.csv','w') as f:
	writer=csv.writer(f)
	writer.writerows(new)
	#print(new)
	#		group[j]=new_val
	#print group
				#writer=csv.writer(f)
				#writer.writerows(new_val)
	#print numpy.mean[val]
	# 	for i in range(len(chunk)):
	# 		grp=chunk[i]
	# 				# grp=grp[6:]
	# 			#group.append(grp)
	# 				# 	for i in range(len(chunks)):
	# 	# 		grp=chunks[i]
	# 		grp=grp[6:]555555
	# 		group.append(grp)
	# print group:

		

	#with open('/Users/moiz/Desktop/post.csv', 'wb') as f:


		# for row in arr:

		# 	# for i in row:
		# 		# 	# chunks=[arr]
		# 	chunks=[arr[x:x+60] for x in xrange(0, len(arr), 5)]
		# 	# print chunks
		# 	group = []
		# 	for i in range(len(chunks)):
		# 		grp=chunks[i]
		# 		# grp=grp[6:]
		# 		group.append(grp)
		# print group
	# 			flat_group = []
	# 			for x in range(len(group)):
	# 				for y in range(len(group[x])):
	# 					flat_group.append(group[x][y])
	# 			avg = []
	# 			unflattened_grp = zip(*[iter(flat_group)]*6)
	# 			for z in range(len(unflattened_grp)):
	# 				avrg = sum(unflattened_grp[z])/len(unflattened_grp[z])
	# 				avg.append(avrg)

	# 			writer = csv.writer(f)
	# 			writer.writerows(arr)
	# 			# for row in avg:
				# 	writer.writerow({'col%d':row} % i)



	# old_list=[]
	# new_list=[]
	# #col = zip(*f)
	# old_list=list(reader)
	# for item in old_list:
	# 	new_list.append(float(item))
	# #arr=int(arr)
	# arr=[float(i) for i in arr]


	# 	for i in row:
	# 		#var=1;
	# 		value=(arr[i+1]+arr[i+2]+arr[i+3]+arr[i+4]+arr[i+5]+arr[i+6]/6)
	# 	print value

			#var=var+6
	#print x
	#for i in arr:
		# print i
		#chunks=[arr[x:x+66] for x in xrange(0, len(arr), 66)]
	#print chunks
	# x=list(reader)
	# print x
	# data=numpy.array(x)
	#print data
	# rows=data.shape[0]
 #  	for i in range (0,rows):
 #  		print data
	#rows=data.shape[1]
	#print rows
	# for row in reader:
	# 	print
	# for x in row:
	# 	print x[3]
# 	arr=[]
# 	for row in reader:
# 		for i in range(0,3):
# 			arr.append(float(row[i]))

# print arr