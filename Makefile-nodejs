SOURCEFILE = prog.js
TARGETFILE = vcs_prog

default: help

help:
	echo "This is Makefile for Node.js Binary"

init: setup build run

setup:
	sudo apt install npm -y
	sudo npm install pkg

build:
	pkg $(SOURCEFILE) -t node10-linux-x64 -o $(TARGETFILE)

run:
	./$(TARGETFILE)

rerun: build run

clean:
	$(RM) $(TARGETFILE)

