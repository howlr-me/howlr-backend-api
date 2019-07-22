
### BUILDER ###
FROM ruby:2.6.2-alpine3.9 AS builder

RUN apk add --update \
  build-base \
  libxml2-dev \
  libxslt-dev \
  postgresql-client \
  postgresql-dev \
  less \
  tzdata \
  bash \
  && rm -rf /var/cache/apk/*

WORKDIR /opt/app
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.0.2 && bundle install --without development test
COPY . .
RUN  rm -f /opt/app/tmp/pids/server.pid

### DEVLOPMENT AND TEST ###
FROM builder as development
WORKDIR /opt/app
RUN bundle install --with development test
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0", "-p", "3000"]

### PRODUCTION ###
FROM ruby:2.6.2-alpine3.9 as production

RUN apk add --update \
  postgresql-client \
  less \
  tzdata \
  bash \
  && rm -rf /var/cache/apk/*

COPY --from=builder /usr/local/bundle /usr/local/bundle
WORKDIR /opt/app
COPY . .
RUN  rm -f /opt/peps/tmp/pids/server.pid
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0", "-p", "3000"]
