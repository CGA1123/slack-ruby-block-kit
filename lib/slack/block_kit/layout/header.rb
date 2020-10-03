# frozen_string_literal: true

module Slack
  module BlockKit
    module Layout
      # A header is a plain-text block that displays in a larger, bold font.
      # Use it to delineate between different groups of content in your app's
      # surfaces.
      #
      # https://api.slack.com/reference/block-kit/blocks#header
      class Header
        TYPE = 'header'

        def initialize(text:, block_id: nil, emoji: nil)
          @text = Composition::PlainText.new(text: text, emoji: emoji)
          @block_id = block_id
        end

        def as_json(*)
          {
            type: TYPE,
            text: @text.as_json,
            block_id: @block_id
          }.compact
        end
      end
    end
  end
end
