FROM ruby:2.6-alpine

RUN apk add git alpine-sdk
RUN bundle config --global frozen 1

WORKDIR /data
RUN gem install eat_your_vegetables

CMD eat_your_vegetables