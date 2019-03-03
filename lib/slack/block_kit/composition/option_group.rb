# frozen_string_literal: true

module Slack
  module BlockKit
    module Composition
      class OptionGroup
        def initialize(label:, options:)
          @label = label
          @options = options
        end

        def as_json(*)
          {
            label: @label.as_json,
            options: options.map(&:as_json)
          }
        end
      end
    end
  end
end
