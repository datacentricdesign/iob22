FROM ubuntu

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get upgrade -y

RUN apt-get install curl ruby-full build-essential zlib1g-dev -y

RUN echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc && \
 echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc && \
  echo 'export PATH="$HOME/gems/bin:\$PATH"' >> ~/.bashrc && \
 source ~/.bashrc

RUN gem install jekyll bundler && gem update --system

EXPOSE 4000

CMD bundle update jekyll && bundle install && bundle exec jekyll serve -H 0.0.0.0