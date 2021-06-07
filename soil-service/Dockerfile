FROM ruby:3.0.1

WORKDIR /usr/src/app/service

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000

CMD ["bundle",  "exec", "rails", "server", "-e", "production"]