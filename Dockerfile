FROM ubuntu:20.04

RUN apt update && apt upgrade -y
RUN apt install -y unzip grep nano python3 g++-10 gcc-10 gcc-7 make
RUN ln /usr/bin/gcc-10  /usr/bin/gcc
RUN ln /usr/bin/g++-10  /usr/bin/g++

COPY ./  /app/LeakReducer

WORKDIR /app/LeakReducer
# RUN unzip-all.sh


