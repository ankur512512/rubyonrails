FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN rm -rf /var/lib/apt/lists/*

# Setting environment variables
ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

RUN mkdir /myapp
WORKDIR /myapp
COPY resources /myapp/
COPY entrypoint.sh /myapp/

# Set config and do bundle install
# RUN bundle config --global frozen 1
RUN gem install bundler:1.17.3 &&  bundle install
# RUN bundle install

EXPOSE 3000

CMD ["./entrypoint.sh"]