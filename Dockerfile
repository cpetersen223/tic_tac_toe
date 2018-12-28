FROM ruby:2.4

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile tic_tac_toe.gemspec .git ./
COPY /lib/tic_tac_toe/version.rb ./lib/tic_tac_toe/

COPY . .

RUN bin/setup

CMD ["bundle", "exec", "exe/tic_tac_toe"]