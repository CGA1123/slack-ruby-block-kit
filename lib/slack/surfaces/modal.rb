# frozen_string_literal: true

module Slack
  module Surfaces
    # Modals provide focused spaces ideal for requesting and collecting data from users,
    # or temporarily displaying dynamic and interactive information.
    #
    # https://api.slack.com/surfaces#modals
    # https://api.slack.com/reference/surfaces/views
    #
    # @param title [String] title is required. Must be set as an initial argument
    #   or using #title for detail setup
    #
    class Modal
      TYPE = 'modal'

      def initialize(
        title: nil,
        blocks: nil,
        private_metadata: nil,
        callback_id: nil,
        external_id: nil,
        clear_on_close: nil,
        notify_on_close: nil
      )
        @blocks = blocks || Slack::BlockKit::Blocks.new

        @private_metadata = private_metadata
        @callback_id = callback_id
        @external_id = external_id

        @clear_on_close = clear_on_close
        @notify_on_close = notify_on_close

        @title = Slack::BlockKit::Composition::PlainText.new(text: title) if title

        @close, @submit = nil
      end

      attr_reader :blocks

      def title(text:, emoji: nil)
        @title = Slack::BlockKit::Composition::PlainText.new(text: text, emoji: emoji)

        self
      end

      def close(text:, emoji: nil)
        @close = Slack::BlockKit::Composition::PlainText.new(text: text, emoji: emoji)

        self
      end

      def submit(text:, emoji: nil)
        @submit = Slack::BlockKit::Composition::PlainText.new(text: text, emoji: emoji)

        self
      end

      def as_json(*) # rubocop:disable Metrics/MethodLength
        {
          type: TYPE,
          blocks: @blocks.as_json,
          title: @title&.as_json,
          close: @close&.as_json,
          submit: @submit&.as_json,
          clear_on_close: @clear_on_close,
          notify_on_close: @notify_on_close,
          private_metadata: @private_metadata,
          callback_id: @callback_id,
          external_id: @external_id
        }.compact
      end
    end
  end
end
