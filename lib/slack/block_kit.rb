# frozen_string_literal: true

require_relative './surfaces'

module Slack
  module BlockKit
    module Composition; end
    module Element; end
    module Layout; end

    VERSION = '0.8.0'

    Dir[File.join(__dir__, 'block_kit', 'composition', '*.rb')].sort.each { |file| require file }
    Dir[File.join(__dir__, 'block_kit', 'element', '*.rb')].sort.each { |file| require file }
    Dir[File.join(__dir__, 'block_kit', 'layout', '*.rb')].sort.each { |file| require file }
    Dir[File.join(__dir__, 'block_kit', '*.rb')].sort.each { |file| require file }

    extend Slack::Surfaces::Message

    module_function

    def blocks
      blocks = Blocks.new

      yield(blocks) if block_given?

      blocks
    end
  end
end
