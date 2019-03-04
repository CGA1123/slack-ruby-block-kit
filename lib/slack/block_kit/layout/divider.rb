# frozen_string_literal: true

module Slack
  module BlockKit
    module Layout
      # A content divider, like an <hr>, to split up different blocks inside of
      # a message.
      #
      # https://api.slack.com/reference/messaging/blocks#divider
      class Divider
        TYPE = 'divider'

        def initialize(block_id: nil)
          @block_id = block_id
        end

        def as_json(*)
          {
            type: TYPE,
            block_id: @block_id
          }.compact
        end
      end
    end
  end
end
