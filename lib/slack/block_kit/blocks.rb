# frozen_string_literal: true

module Slack
  module BlockKit
    # Blocks are a series of components that can be combined to create visually
    # rich and compellingly interactive messages.
    #
    # https://api.slack.com/reference/messaging/blocks
    class Blocks
      attr_accessor :blocks

      def initialize
        @blocks = []

        yield(self) if block_given?
      end

      def actions(block_id: nil)
        block = Layout::Actions.new(block_id: block_id)

        yield(block) if block_given?

        append(block)
      end

      def context(block_id: nil)
        block = Layout::Context.new(block_id: block_id)

        yield(block) if block_given?

        append(block)
      end

      def divider(block_id: nil)
        block = Layout::Divider.new(block_id: block_id)

        append(block)
      end

      def header(text:, block_id: nil, emoji: nil)
        block = Layout::Header.new(text: text, block_id: block_id, emoji: emoji)

        append(block)
      end

      def image(url:, alt_text:, title: nil, block_id: nil, emoji: nil)
        block = Layout::Image.new(
          url: url,
          alt_text: alt_text,
          title: title,
          block_id: block_id,
          emoji: emoji
        )

        append(block)
      end

      def section(block_id: nil)
        block = Layout::Section.new(block_id: block_id)

        yield(block) if block_given?

        append(block)
      end

      def input(label:, hint: nil, block_id: nil)
        block = Layout::Input.new(
          label: label,
          hint: hint,
          block_id: block_id
        )

        yield(block) if block_given?

        append(block)
      end

      def append(block)
        @blocks << block

        self
      end

      def as_json(*)
        @blocks.map(&:as_json)
      end
    end
  end
end
