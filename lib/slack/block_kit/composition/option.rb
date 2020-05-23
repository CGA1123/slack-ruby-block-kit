# frozen_string_literal: true

module Slack
  module BlockKit
    module Composition
      # An object that represents a single selectable item in a select menu.
      #
      # https://api.slack.com/reference/messaging/composition-objects#option
      # https://api.slack.com/reference/messaging/block-elements#select
      class Option
        def initialize(value:, text:, emoji: nil, description: nil, url: nil)
          @text = PlainText.new(text: text, emoji: emoji)
          @value = value
          @description = description && PlainText.new(text: description, emoji: emoji)
          @url = url
        end

        def as_json(*)
          {
            text: @text.as_json,
            value: @value,
            description: @description&.as_json,
            url: @url
          }.compact
        end
      end
    end
  end
end
