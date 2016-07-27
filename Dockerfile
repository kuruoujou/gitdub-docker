FROM ruby
MAINTAINER Spencer Julian <smjulian@purdue.edu>

RUN apt-get update \
 && apt-get install -y net-tools git git-notifier \
 && gem install sinatra \
 && cd /opt/ \
 && git clone https://github.com/mavam/gitdub.git \
 && mkdir /config \
 && cp /opt/gitdub/config.yml.example /config/config.yml

VOLUME [ "/config" ]

CMD ["/opt/gitdub/gitdub", "/config/config.yml"]
