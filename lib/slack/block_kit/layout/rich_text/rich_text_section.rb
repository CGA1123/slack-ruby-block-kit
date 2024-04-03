# frozen_string_literal: true

module Slack
  module BlockKit
    module Layout
      class RichText
        # https://api.slack.com/reference/block-kit/blocks#rich_text_section
        class RichTextSection
          include RichTextElements
          TYPE = 'rich_text_section'

          attr_accessor :elements

          def initialize
            @elements = []

            yield(self) if block_given?
          end

          def append(element)
            @elements << element

            self
          end

          def as_json(*)
            {
              type: TYPE,
              elements: @elements.map(&:as_json)
            }.compact
          end
        end
      end
    end
  end
end
