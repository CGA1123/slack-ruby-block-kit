# frozen_string_literal: true

module Slack
  module BlockKit
    module Composition
      class Text
        def initialize(type:, text:, emoji: nil, verbatim: nil)
          @type = type
          @text = text
          @emoji = emoji
          @verbatim = verbatim
        end

        def self.plaintext(text:, emoji: nil)
          new(
            type: 'plain_text',
            text: text,
            emoji: emoji
          )
        end

        def self.markdown(text:, verbatim: nil)
          new(
            type: 'mrkdwn',
            text: text,
            verbatim: verbatim
          )
        end

        def as_json(*)
          {
            type: @type,
            text: @text,
            emoji: @emoji,
            verbatim: @verbatim
          }.compact
        end
      end
    end
  end
end
