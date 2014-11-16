FROM rails:4.1.7

# Put here any gem dependencies
RUN apt-get update && apt-get install libicu-dev -y

COPY Gemfile /usr/src/app/Gemfile
COPY Gemfile.lock /usr/src/app/Gemfile.lock

WORKDIR /usr/src/app

RUN bundle config --global frozen 0
RUN bundle install

COPY . /usr/src/app

EXPOSE 3000

CMD rails server puma

