# frozen_string_literal: true

module Slack
  module Surfaces
    # The Home tab is a persistent, yet dynamic interface
    # for apps that lives within the App Home.
    #
    # https://api.slack.com/surfaces#tabs
    # https://api.slack.com/reference/surfaces/views
    class Home
      TYPE = 'home'

      def initialize(blocks: nil,
                     private_metadata: nil, callback_id: nil, external_id: nil)
        @blocks = blocks || Slack::BlockKit::Blocks.new

        @private_metadata = private_metadata
        @callback_id = callback_id
        @external_id = external_id
      end

      attr_reader :blocks

      def as_json(*)
        {
          type: TYPE,
          blocks: @blocks.as_json,
          private_metadata: @private_metadata,
          callback_id: @callback_id,
          external_id: @external_id
        }.compact
      end
    end
  end
end
