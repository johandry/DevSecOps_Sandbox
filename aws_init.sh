#!/bin/bash

echo "Install dependencies"
sudo yum update -y
sudo yum install -y git
sudo yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel

sudo rpm -ivh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-6.noarch.rpm
sudo yum -y install nodejs
sudo yum -y install mariadb mariadb-server mariadb-devel

sudo systemctl start mariadb.service

echo "Install Ruby"
cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile

source ~/.bash_profile

rbenv install -v 2.3.1
rbenv global 2.3.1
ruby -v
gem install bundler --no-ri --no-rdoc
gem install rails --no-ri --no-rdoc

git clone https://github.com/johandry/DevSecOps_Sandbox.git DevSecOps

cd DevSecOps

bundle install
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rails server -b 0.0.0.0
