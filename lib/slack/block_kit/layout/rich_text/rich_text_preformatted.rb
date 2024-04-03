# frozen_string_literal: true

module Slack
  module BlockKit
    module Layout
      class RichText
        # https://api.slack.com/reference/block-kit/blocks#rich_text_preformatted
        class RichTextPreformatted
          include RichTextElements
          TYPE = 'rich_text_preformatted'

          attr_accessor :elements, :border

          def initialize(border: nil)
            @elements = []
            @border = border

            yield(self) if block_given?
          end

          def append(element)
            @elements << element

            self
          end

          def as_json(*)
            {
              type: TYPE,
              border: @border,
              elements: @elements.map(&:as_json)
            }.compact
          end
        end
      end
    end
  end
end
