# frozen_string_literal: true

module Slack
  module BlockKit
    module Limits
      module Errors
        class IncompatibleOptionsError < ::Slack::BlockKit::BlockKitError
          def initialize(msg = 'The parameters of this block are incompatible')
            super
          end
        end
      end
    end
  end
end
