FROM ruby:2.5-alpine
LABEL maintainer="koskoci.balazs@gmail.com"
EXPOSE 4567

WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle install
COPY . .

CMD ["rackup", "-s", "webrick", "-p", "4567", "-o", "0.0.0.0"]
