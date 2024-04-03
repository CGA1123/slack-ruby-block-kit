# frozen_string_literal: true

module Slack
  module BlockKit
    module Layout
      class RichText
        # https://api.slack.com/reference/block-kit/blocks#rich_text_list
        class RichTextList
          TYPE = 'rich_text_list'

          attr_accessor :style, :elements, :indent, :offset, :border

          def initialize(style:, indent: nil, offset: nil, border: nil)
            @elements = []
            @style = style
            @indent = indent
            @offset = offset
            @border = border

            yield(self) if block_given?
          end

          def rich_text_section
            element = RichTextSection.new

            yield(element) if block_given?

            append(element)
          end

          def append(element)
            @elements << element

            self
          end

          def as_json(*)
            {
              type: TYPE,
              style: @style,
              elements: @elements.map(&:as_json),
              indent: @indent,
              offset: @offset,
              border: @border
            }.compact
          end
        end
      end
    end
  end
end
