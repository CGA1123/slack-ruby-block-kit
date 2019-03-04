# frozen_string_literal: true

module Slack
  module BlockKit
    module Composition
      # An object that represents a single selectable item in a select menu.
      #
      # https://api.slack.com/reference/messaging/composition-objects#option
      # https://api.slack.com/reference/messaging/block-elements#select
      class Option
        def initialize(value:, text:, emoji: nil)
          @text = PlainText.new(text: text, emoji: emoji)
          @value = value
        end

        def as_json(*)
          {
            text: @text.as_json,
            value: @value
          }
        end
      end
    end
  end
end
