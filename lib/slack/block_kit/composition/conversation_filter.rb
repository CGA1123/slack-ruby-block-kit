# frozen_string_literal: true

module Slack
  module BlockKit
    module Composition
      # Provides a way to filter the list of optionsin a conversations select menu
      # or conversations multi-select menu.
      #
      # @param [Array] conversation_types - "include" field
      #
      # https://api.slack.com/reference/block-kit/composition-objects#filter_conversations
      # https://api.slack.com/reference/block-kit/block-elements#conversation_multi_select
      # https://api.slack.com/reference/block-kit/block-elements#conversation_select
      class ConversationFilter
        def initialize(conversation_types: nil,
                       exclude_external_shared_channels: nil,
                       exclude_bot_users: nil)
          @conversation_types = conversation_types
          @exclude_external_shared_channels = exclude_external_shared_channels
          @exclude_bot_users = exclude_bot_users
        end

        def as_json(*)
          {
            include: @conversation_types,
            exclude_external_shared_channels: @exclude_external_shared_channels,
            exclude_bot_users: @exclude_bot_users
          }.compact
        end
      end
    end
  end
end
