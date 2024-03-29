# frozen_string_literal: true

module Slack
  module BlockKit
    module Element
      # A select menu, just as with a standard HTML <select> tag, creates a drop
      # down menu with a list of options for a user to choose. The select menu
      # also includes type-ahead functionality, where a user can type a part or
      # all of an option string to filter the list.
      #
      # This select menu will populate its options with a list of public and
      # private channels, DMs, and MPIMs visible to the current user in the
      # active workspace.
      #
      # https://api.slack.com/reference/messaging/block-elements#conversation-select
      class ConversationsSelect
        include Composition::ConfirmationDialog::Confirmable

        TYPE = 'conversations_select'

        def initialize(
          placeholder:,
          action_id:,
          initial: nil,
          emoji: nil,
          focus_on_load: nil,
          default_to_current_conversation: nil,
          response_url_enabled: nil
        )
          @placeholder = Composition::PlainText.new(text: placeholder, emoji: emoji)
          @action_id = action_id
          @initial_conversation = initial
          @focus_on_load = focus_on_load
          @filter = nil
          @default_to_current_conversation = default_to_current_conversation
          @response_url_enabled = response_url_enabled

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
            focus_on_load: @focus_on_load,
            initial_conversation: @initial_conversation,
            confirm: confirm&.as_json,
            filter: @filter&.as_json,
            default_to_current_conversation: @default_to_current_conversation,
            response_url_enabled: @response_url_enabled
          }.compact
        end
      end
    end
  end
end
