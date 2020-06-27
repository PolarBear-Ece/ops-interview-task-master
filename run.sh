#!/bin/bash

#All work in dev 

mkdir dev
cd dev || exit

#Getting Vagrant Box
sudo apt-get install virtualbox
sudo apt-get install vagrant
vagrant box add ubuntu/xenial64
vagrant init ubuntu/xenial64
vagrant up
vagrant ssh