SOURCEFILE = prog.py
TARGETFILE = vcs_prog

default: help

help:
	echo "This is Makefile for Python Binary"

init: setup build run

setup:
	sudo apt install python3-dev -y
	sudo apt install python3-pip -y
	sudo pip3 install pyinstaller

build:
	pyinstaller $(SOURCEFILE) --onefile --name $(TARGETFILE)

run:
	dist/$(TARGETFILE)

rerun: build run

clean:
	rm -rf build dist __pycache__ *.spec

