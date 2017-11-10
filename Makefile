#Makefile for a program to show actie processes
# For CSC3004 Software Development

# Put your user name below:
USER= skon

CC= g++

#For Optimization
#CFLAGS= -O2
#For debugging
CFLAGS= -g

RM= /bin/rm -f

all: processList testProcessList PutCGI PutHTML

testProcessList.o: testProcessList.cpp pstream.h
	$(CC) -c $(CFLAGS) testProcessList.cpp

processList.o: processList.cpp pstream.h
	$(CC) -c $(CFLAGS) processList.cpp

testProcessList: testProcessList.o
	$(CC) testProcessList.o -o testProcessList

processList: processList.o 
	$(CC) processList.o  -o processList -L/usr/local/lib -lcgicc

PutCGI: processList
	chmod 757 processList
	cp processList /usr/lib/cgi-bin/$(USER)_processList.cgi 

	echo "Current contents of your cgi-bin directory: "
	ls -l /usr/lib/cgi-bin/

PutHTML:
	cp processList.html /var/www/html/class/softdev/$(USER)/processList/
	cp processList.css /var/www/html/class/softdev/$(USER)/processList/
	cp processList.js /var/www/html/class/softdev/$(USER)/processList/

	echo "Current contents of your HTML directory: "
	ls -l /var/www/html/class/softdev/$(USER)/processList/

clean:
	rm -f *.o testProcessList processList
