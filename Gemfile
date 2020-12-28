# frozen_string_literal: true

source 'https://rubygems.org'

gemspec

gem 'rubocop', '~> 1'
gem 'rubocop-rspec', '~> 2'
gem 'rspec', '~> 3'
gem 'rake', '~> 13'
gem 'rspec_junit_formatter', '~> 0.4'
gem 'pry', '~> 0.13'
gem 'faraday', '~> 1'
gem 'dotenv', '~> 2'

if Gem::Version.new(RUBY_VERSION) < Gem::Version.new('3')
  gem 'codecov', '~> 0.2', require: false
  gem 'simplecov', '~> 0.20', require: false
end
