# frozen_string_literal: true

module Slack
  module Surfaces
    # App-published messages are dynamic yet transient spaces.
    # They allow users to complete workflows among their Slack conversations.
    #
    # https://api.slack.com/surfaces#messages
    module Message
      TYPE = 'message'

      def initialize(blocks: nil)
        @blocks = blocks || Slack::BlockKit::Blocks.new
      end

      attr_reader :blocks

      def as_json(*)
        {
          blocks: @block.as_json
        }
      end
    end
  end
end
