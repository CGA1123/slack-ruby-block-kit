# frozen_string_literal: true

source 'https://rubygems.org'

gemspec

gem 'rubocop', '1.7.0'
gem 'rubocop-rspec', '2.1.0'

if Gem::Version.new(RUBY_VERSION) < Gem::Version.new('3')
  gem 'codecov', require: false
  gem 'simplecov', require: false
end
