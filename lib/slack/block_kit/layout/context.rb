# frozen_string_literal: true

module Slack
  module BlockKit
    module Layout
      # Displays message context, which can include both images and text.
      #
      # https://api.slack.com/reference/messaging/blocks#context
      class Context
        TYPE = 'context'

        attr_accessor :elements

        def initialize(block_id: nil)
          @block_id = block_id
          @elements = []

          yield(self) if block_given?
        end

        def image(url:, alt_text:)
          append(Element::Image.new(image_url: url, alt_text: alt_text))
        end

        def plain_text(text:, emoji: nil)
          append(Composition::PlainText.new(text: text, emoji: emoji))
        end

        def mrkdwn(text:, verbatim: nil)
          append(Composition::Mrkdwn.new(text: text, verbatim: verbatim))
        end

        def append(element)
          @elements << element

          self
        end

        def as_json(*)
          {
            type: TYPE,
            elements: @elements.map(&:as_json),
            block_id: @block_id
          }.compact
        end
      end
    end
  end
end
