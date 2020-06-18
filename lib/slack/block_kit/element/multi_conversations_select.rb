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
        TYPE = 'multi_conversations_select'

        attr_accessor :confirm

        def initialize(placeholder:, action_id:, initial: nil, emoji: nil, max_selected_items: nil)
          @placeholder = Composition::PlainText.new(text: placeholder, emoji: emoji)
          @action_id = action_id
          @initial_conversation = initial
          @confirm = nil
          @max_selected_items = max_selected_items

          yield(self) if block_given?
        end

        def confirmation_dialog
          @confirm = Composition::ConfirmationDialog.new

          yield(@confirm) if block_given?

          self
        end

        def as_json(*)
          {
            type: TYPE,
            placeholder: @placeholder.as_json,
            action_id: @action_id,
            initial_conversation: @initial_conversation,
            confirm: @confirm&.as_json,
            max_selected_items: @max_selected_items
          }.compact
        end
      end
    end
  end
end
