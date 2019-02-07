FROM ruby:2.6-alpine

RUN apk add git alpine-sdk
RUN bundle config --global frozen 1

WORKDIR /data
COPY lib/eat_your_vegetables/version.rb /usr/src/app # Just copy this for the version bump
RUN gem install eat_your_vegetables

CMD eat_your_vegetables