module Slack
  module BlockKit
    class Configuration
      attr_accessor :autofix_invalid_blocks

      def initialize
        @autofix_invalid_blocks = false
      end

      def autofix_invalid_blocks?
        !!@autofix_invalid_blocks
      end
    end
  end
end
