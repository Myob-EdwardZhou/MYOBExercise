# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

ruby '2.5.0'

gem 'rake'
gem 'colorize'
gem 'activesupport'
gem 'virtus'
gem 'require_all'

group 'development, test' do
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'rubocop', require: false
  gem 'cane', require: false
  gem 'byebug'
end
