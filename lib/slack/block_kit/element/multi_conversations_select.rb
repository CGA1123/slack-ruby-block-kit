# frozen_string_literal: true

module Slack
  module BlockKit
    module Element
      # A select menu, just as with a standard HTML <select> tag, creates a drop
      # down menu with a list of options for a user to choose. The select menu
      # also includes type-ahead functionality, where a user can type a part or
      # all of an option string to filter the list.
      #
      # This multi-select menu will populate its options with a list of public and
      # private channels, DMs, and MPIMs visible to the current user in the
      # active workspace.
      #
      # https://api.slack.com/reference/block-kit/block-elements#conversation_multi_select
      class MultiConversationsSelect
        include Composition::ConfirmationDialog::Confirmable

        TYPE = 'multi_conversations_select'

        def initialize(
          placeholder:,
          action_id:,
          initial: nil,
          emoji: nil,
          max_selected_items: nil,
          focus_on_load: nil,
          default_to_current_conversation: nil
        )
          @placeholder = Composition::PlainText.new(text: placeholder, emoji: emoji)
          @action_id = action_id
          @initial_conversations = initial
          @max_selected_items = max_selected_items
          @focus_on_load = focus_on_load
          @filter = nil
          @default_to_current_conversation = default_to_current_conversation

          yield(self) if block_given?
        end

        def filter(only: nil,
                   exclude_external_shared_channels: nil,
                   exclude_bot_users: nil)
          @filter = Composition::ConversationFilter.new(
            only: only,
            exclude_external_shared_channels: exclude_external_shared_channels,
            exclude_bot_users: exclude_bot_users
          )

          self
        end

        def as_json(*)
          {
            type: TYPE,
            placeholder: @placeholder.as_json,
            action_id: @action_id,
            initial_conversations: @initial_conversations,
            focus_on_load: @focus_on_load,
            confirm: confirm&.as_json,
            max_selected_items: @max_selected_items,
            filter: @filter&.as_json,
            default_to_current_conversation: @default_to_current_conversation
          }.compact
        end
      end
    end
  end
end
