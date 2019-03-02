# frozen_string_literal: true

module Slack
  module BlockKit
    module Composition
      class Option
        def initialize(text:, value:)
          @text = text
          @value = value
        end

        def to_h
          {
            text: @text.to_h,
            value: @value
          }
        end
      end
    end
  end
end
