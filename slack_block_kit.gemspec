# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slack/block_kit'

Gem::Specification.new do |spec|
  spec.name          = 'slack_block_kit'
  spec.version       = Slack::BlockKit::VERSION
  spec.authors       = ['Christian Gregg']
  spec.email         = ['c_arlt@hotmail.com']
  spec.summary       = "A ruby wrapper for Slack's Block Kit"
  spec.homepage      = 'https://github.com/CGA1123/slack_block_kit-ruby'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`
      .split("\x0")
      .reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.5'

  spec.add_development_dependency 'bundler', '< 2.0'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
end
