FROM ubuntu:latest

COPY Gemfile /home/root/
# Add multiverse repo. Install nginx, jekyll and some ruby-packages
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y ruby-full build-essential zlib1g-dev

#RUN useradd -ms /bin/bash ubuntu
#USER ubuntu
#WORKDIR /home/ubuntu

WORKDIR /home/root/

ENV GEM_HOME /home/root/gems
ENV PATH="/home/root/gems/bin:$PATH"
RUN \
  #echo '# Install Ruby Gems to ~/gems' >> /home/root/.bashrc && \
  #echo 'export PATH="$HOME/gems/bin:$PATH"' >> /home/root/.bashrc && \
  gem install jekyll bundler && \
  bundle install


#RUN apt-get install sudo -y
