#!/usr/bin/env bash

<<DESC
Bootstrapping a software project requires special considerations,
especially when the product concept isn't completely defined.
As one undertakes a project, many of the pieces that need to be built may not be fully designed or completely developed.
All of this wreaks havoc on a development schedule.
Bootstrapping is the process of getting a software development project moving from a standing start. 
DESC

# exit when a command fails
set -o errexit

MAILTO=raktim.mitkar.io

##########
# GIT
##########
install_git(){
    #if hash /usr/bin/git 2>/dev/null; then
    #if [ -x "$(hash /usr/bin/git)" ] ; then
    if command -v /usr/bin/git &> /dev/null; then
        /usr/bin/git --version
    else
        echo "Installing Git ..."
        if [ -f /etc/redhat-release ]; then
            /usr/bin/yum -q -y install git
            install_git
        elif [ -f /etc/lsb-release ]; then
            /usr/bin/apt -q -y install git
            install_git
        fi
    fi
}

##########
# PYTHON3
##########
install_python3(){
    if command -v /usr/bin/python3 &> /dev/null; then
        /usr/bin/python3 --version
    else
        echo "Installing Python3 ..."
        if [ -f /etc/redhat-release ]; then
            /usr/bin/yum -q -y install python3
            install_python3
        elif [ -f /etc/lsb-release ]; then
            /usr/bin/apt -q -y install python3
            install_python3
        fi
    fi
}

install_git
install_python3
