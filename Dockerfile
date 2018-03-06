# FROM ruby:2.1-onbuild
# CMD ["./marketing-service.rb"]

FROM ruby:latest
RUN mkdir /usr/src/app
ADD . /usr/src/app
WORKDIR /usr/src/app
CMD ["/usr/src/app/marketing-service.rb"]
