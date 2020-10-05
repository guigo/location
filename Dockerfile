FROM ruby:2.7.0

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /location

WORKDIR /location

COPY Gemfile /location/Gemfile
COPY Gemfile.lock /location/Gemfile.lock

RUN bundle install

COPY . /location

COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"]