FROM ruby:2.7.0

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -qq -y build-essential libpq-dev nodejs yarn

RUN mkdir /build && mkdir /location
WORKDIR /build

ADD ./package.json /location/
RUN yarn install

WORKDIR /location

 RUN cp -a /build/node_modules/ /location/

COPY Gemfile /location/Gemfile
COPY Gemfile.lock /location/Gemfile.lock


RUN bundle install

COPY . /location

COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"]