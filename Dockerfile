#Using the base image
FROM golang:latest

LABEL creater = "mohit.gupta.ece16@itbhu.ac.in"

ARG redis_addr=0.0.0.0:6379
ARG app_addr=0.0.0.0:8080

# Setting the Environment Variables
ENV DEMO_REDIS_ADDR ${redis_addr} 
ENV DEMO_APP_ADDR ${app_addr}

#Creating Directory for data

RUN    mkdir --verbose  -p /project/ 
RUN	ls \
	&& pwd \
	&& cd / \
	&& ls \
	&& echo "$DEMO_REDIS_ADDR" \
	&& echo "$redis_addr"
       

ADD	go.mod  /project
ADD     .gitignore /project
ADD      go.sum /project
ADD     main.go /project
ADD     Makefile /project
ADD     README.md /project 
	

#Add make module and and get binary file

RUN cd /project/ \
	&&  apt-get update \
	&& apt-get install make \
	&& ls \
	&& go get github.com/go-chi/chi \
	&& go get github.com/gomodule/redigo/redis \ 
	&& make VERSION=1 
         
WORKDIR /project/ 

CMD make run
