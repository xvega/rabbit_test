FROM ruby:2.5.1-alpine
MAINTAINER Xavi Vega <xabi1309@gmail.com>

RUN echo -e "http://nl.alpinelinux.org/alpine/v3.8/main\nhttp://nl.alpinelinux.org/alpine/v3.8/community" > /etc/apk/repositories
RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache \
    build-base curl-dev git curl bash postgresql-dev \
    tzdata yaml-dev zlib-dev nodejs

WORKDIR /var/www/rabbit_test

COPY Gemfile* ./
RUN bundle install
EXPOSE 3000

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]