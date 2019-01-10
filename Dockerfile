FROM ruby:2.5-alpine
LABEL maintainer="koskoci.balazs@gmail.com"
EXPOSE 8080

ADD views/start.haml views/start.haml
ADD app.rb app.rb
ADD config.ru config.ru

CMD rackup
