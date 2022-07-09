# frozen_string_literal: true

require 'zeitwerk'

loader = Zeitwerk::Loader.new
loader.tag = 'slack-ruby-block-kit'
loader.push_dir(__dir__)
loader.ignore(__FILE__)
loader.inflector.inflect('version' => 'VERSION')
loader.setup

require 'slack/block_kit'

loader.eager_load
