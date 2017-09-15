FROM ubuntu:16.04

# install python and conda
COPY sources.list /usr/local/src/sources.list
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
	cp /usr/local/src/sources.list /etc/apt/sources.list
	
RUN apt-get update && apt-get install -y python3 git wget bzip2

# source activate need bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# timezone
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# chinese support
ENV LANG C.UTF-8

