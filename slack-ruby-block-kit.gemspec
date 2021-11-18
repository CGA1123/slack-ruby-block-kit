# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slack/block_kit/version'

Gem::Specification.new do |spec|
  spec.name          = 'slack-ruby-block-kit'
  spec.version       = Slack::BlockKit::VERSION
  spec.authors       = ['Christian Gregg']
  spec.email         = ['c_arlt@hotmail.com']
  spec.summary       = "A ruby wrapper for Slack's Block Kit"
  spec.homepage      = 'https://github.com/CGA1123/slack-ruby-block-kit'
  spec.license       = 'MIT'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`
      .split("\x0")
      .reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.5'
  spec.metadata = {
    'rubygems_mfa_required' => 'true'
  }
end
