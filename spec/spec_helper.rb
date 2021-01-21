# frozen_string_literal: true

require 'simplecov'
require 'codecov'

SimpleCov.start do
  enable_coverage :branch
  add_filter '/spec/'
  track_files 'lib/slack/**/*.rb'
  formatter SimpleCov::Formatter::Codecov if ENV['CI']
end

require 'slack/block_kit'
require 'pry'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  config.example_status_persistence_file_path = 'spec/examples.txt'
  config.disable_monkey_patching!
  config.warnings = true
  config.profile_examples = 10
  config.order = :random

  config.default_formatter = 'doc' if config.files_to_run.one?

  Kernel.srand config.seed
end
