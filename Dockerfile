FROM ubuntu

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update --yes
RUN apt-get upgrade --quiet --yes
RUN apt-get install --quiet --yes curl
RUN apt-get install --quiet --yes build-essential
RUN apt-get install --quiet --yes wget
RUN apt-get install --quiet --yes ruby1.9.3
RUN apt-get install --quiet --yes libpq-dev

RUN gem install --no-rdoc --no-ri bundler

ADD . /var/www/
RUN cd /var/www && bundle install

EXPOSE 3000
ENTRYPOINT cd /var/www && /usr/bin/env RUBYOPT=-Ilib bundle exec thin start -R rackup.ru
