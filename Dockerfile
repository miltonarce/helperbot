FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y
RUN mkdir /helperbot
WORKDIR /helperbot
ADD Gemfile /helperbot/Gemfile
ADD Gemfile.lock /helperbot/Gemfile.lock
RUN gem install rails bundler
RUN bundle check || bundle install
ADD . /helperbot

# Add a script to be executed every time the container starts.
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
# EXPOSE 3000

# # Start the main process.
# CMD ["rails", "server", "-b", "0.0.0.0"]