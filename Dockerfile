# Dockerfile
# Use ruby image to build our own image
FROM ruby:2.7.1

RUN apt-get update -qq && apt-get install -y libsqlite3-dev
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile

RUN bundle install
COPY . /myapp


# Add a script to be executed every time the container starts.
COPY entrypoints/docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
