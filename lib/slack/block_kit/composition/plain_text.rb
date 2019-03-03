# frozen_string_literal: true

module Slack
  module BlockKit
    module Composition

      # An object containing some text, formatted using plain text.
      #
      # https://api.slack.com/reference/messaging/composition-objects#text
      class PlainText
        TYPE = 'plain_text'

        def initialize(text:, emoji: nil)
          @text = text
          @emoji = emoji
        end

        def as_json(*)
          {
            type: TYPE,
            text: @text,
            emoji: @emoji
          }.compact
        end
      end
    end
  end
end
