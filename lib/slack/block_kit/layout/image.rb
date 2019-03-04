# frozen_string_literal: true

module Slack
  module BlockKit
    module Layout

      # A simple image block, designed to make those cat photos really pop.
      #
      # https://api.slack.com/reference/messaging/blocks#context
      class Image
        TYPE = 'image'

        def initialize(url:, alt_text:, title: nil, block_id: nil, emoji: nil)
          @image_url = url
          @alt_text = alt_text
          @block_id = block_id
          @title = Composition::PlainText.new(
            text: title,
            emoji: emoji
          ) if title
        end

        def as_json(*)
          {
            type: TYPE,
            image_url: @image_url,
            alt_text: @alt_text,
            title: @title&.as_json,
            block_id: @block_id
          }.compact
        end
      end
    end
  end
end
