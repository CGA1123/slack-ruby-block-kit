# frozen_string_literal: true

module Slack
  module Surfaces
    # App-published messages are dynamic yet transient spaces.
    # They allow users to complete workflows among their Slack conversations.
    #
    # https://api.slack.com/surfaces#messages
    # https://api.slack.com/messaging/composing#complex_layouts
    module Message
      TYPE = 'message'

      def initialize(blocks: nil,
                     channel: nil, thread_ts: nil, as_user: nil)
        @blocks = blocks || Slack::BlockKit::Blocks.new
        @channel = channel
        @thread_ts = thread_ts
        @as_user = as_user
      end

      attr_reader :blocks

      def as_json(*)
        {
          channel: @channel,
          thread_ts: @thread_ts,
          as_user: @as_user,
          blocks: @block.as_json
        }.compact
      end
    end
  end
end
