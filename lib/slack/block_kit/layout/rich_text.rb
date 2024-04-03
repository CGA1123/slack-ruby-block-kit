# frozen_string_literal: true

module Slack
  module BlockKit
    module Layout
      # Displays formatted, structured representation of text.
      #
      # It is also the output of the Slack client's WYSIWYG message composer, so all messages sent by end-users will have this
      # format. Use this block to include user-defined formatted text in your Block Kit payload. While it is possible to format
      # text with mrkdwn, rich_text is strongly preferred and allows greater flexibility.
      #
      # https://api.slack.com/reference/block-kit/blocks#rich_text
      class RichText
        TYPE = 'rich_text'

        attr_accessor :elements

        def initialize(block_id: nil)
          @block_id = block_id
          @elements = []

          yield(self) if block_given?
        end

        def rich_text_section
          element = RichTextSection.new

          yield(element) if block_given?

          append(element)
        end

        def rich_text_list(style: 'bullet', indent: nil, offset: nil, border: nil)
          element = RichTextList.new(style: style, indent: indent, offset: offset, border: border)

          yield(element) if block_given?

          append(element)
        end

        def rich_text_preformatted(border: nil)
          element = RichTextPreformatted.new(border: border)

          yield(element) if block_given?

          append(element)
        end

        def rich_text_quote(border: nil)
          element = RichTextQuote.new(border: border)

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
            elements: @elements.map(&:as_json),
            block_id: @block_id
          }.compact
        end
      end
    end
  end
end
