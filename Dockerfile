FROM ruby:2.4.4-alpine3.7

RUN apk add --update --no-cache ruby-dev alpine-sdk

RUN gem update --system \
    && gem install compass \
    && gem install animate -v 0.1.0 \
    && gem install animation -v 0.1.alpha.3

RUN mkdir /app

WORKDIR /app

RUN apk del --update ruby-dev alpine-sdk && rm -rf /var/cache/apk/*  

ENTRYPOINT ["compass"]