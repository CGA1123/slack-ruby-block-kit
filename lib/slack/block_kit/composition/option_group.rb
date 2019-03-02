# frozen_string_literal: true

module Slack
  module Blocks
    module Composition
      class OptionGroup
        def initialize(label:, options:)
          @label = label
          @options = options
        end

        def to_h
          {
            label: @label.to_h,
            options: options.map(&:to_h)
          }
        end
      end
    end
  end
end
