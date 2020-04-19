# ベースのイメージ
FROM ubuntu:18.04

# 作成したユーザの情報
LABEL maintainer="Nahuel"

# Julius_Setup
RUN apt-get update && apt-get install -y wget build-essential unzip && apt-get clean
RUN wget https://zenodo.org/record/2530396/files/julius-speech/julius-v4.5.zip && unzip julius-v4.5.zip && cd julius-speech-julius-36de469/ && ./configure && make && make install

# OpenJTalk_Setup
RUN apt-get install -y open-jtalk open-jtalk-mecab-naist-jdic hts-voice-nitech-jp-atr503-m001
RUN wget https://sourceforge.net/projects/mmdagent/files/MMDAgent_Example/MMDAgent_Example-1.8/MMDAgent_Example-1.8.zip/download -O MMDAgent_Example-1.8.zip
RUN unzip MMDAgent_Example-1.8.zip MMDAgent_Example-1.8/Voice/*
RUN cp -r MMDAgent_Example-1.8/Voice/mei/ /usr/share/hts-voice
