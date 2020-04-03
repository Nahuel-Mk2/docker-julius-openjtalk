# ベースのイメージ
FROM ubuntu:18.04

# 作成したユーザの情報
LABEL maintainer="Nahuel"

ENV JULIUS_VERSION 4.5

# Julius_Setup
RUN apt-get update && apt-get install -y curl build-essential && apt-get clean
RUN wget https://zenodo.org/record/2530396/files/julius-speech/julius-v$JULIUS_VERSION.zip
RUN unzip julius-v$JULIUS_VERSION.zip
RUN cd julius-speech-julius-36de469/
RUN ./configure && make && make install

#OpenJTalk_Setup
RUN apt-get install -y open-jtalk
RUN apt-get install -y open-jtalk-mecab-naist-jdic
RUN apt-get install -y hts-voice-nitech-jp-atr503-m001
RUN wget https://sourceforge.net/projects/mmdagent/files/MMDAgent_Example/MMDAgent_Example-1.6/MMDAgent_Example-1.8.zip/download -O MMDAgent_Example-1.8.zip
RUN unzip MMDAgent_Example-1.8.zip MMDAgent_Example-1.8/Voice/*
RUN cp -r MMDAgent_Example-1.8/Voice/mei/ /usr/share/hts-voice
