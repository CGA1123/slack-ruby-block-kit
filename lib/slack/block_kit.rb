# frozen_string_literal: true

module Slack
  module BlockKit
    module Composition; end
    module Element; end
    module Layout; end

    VERSION = '0.3.3'

    Dir[File.join(__dir__, 'block_kit', 'composition', '*.rb')].each { |file| require file }
    Dir[File.join(__dir__, 'block_kit', 'element', '*.rb')].each { |file| require file }
    Dir[File.join(__dir__, 'block_kit', 'layout', '*.rb')].each { |file| require file }
    Dir[File.join(__dir__, 'block_kit', '*.rb')].each { |file| require file }

    module_function

    def blocks
      blocks = Blocks.new

      yield(blocks) if block_given?

      blocks
    end
  end
end
