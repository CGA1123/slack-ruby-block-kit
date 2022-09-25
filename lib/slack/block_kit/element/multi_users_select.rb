# frozen_string_literal: true

module Slack
  module BlockKit
    module Element
      # A select menu, just as with a standard HTML <select> tag, creates a drop
      # down menu with a list of options for a user to choose. The select menu
      # also includes type-ahead functionality, where a user can type a part or
      # all of an option string to filter the list.
      #
      # This multi-select menu will populate its options with a list of Slack users
      # visible to the current user in the active workspace.
      #
      # https://api.slack.com/reference/block-kit/block-elements#users_multi_select
      class MultiUsersSelect
        include Composition::ConfirmationDialog::Confirmable

        TYPE = 'multi_users_select'

        def initialize(
          placeholder:,
          action_id:,
          initial: nil,
          emoji: nil,
          max_selected_items: nil,
          focus_on_load: nil
        )
          @placeholder = Composition::PlainText.new(text: placeholder, emoji: emoji)
          @action_id = action_id
          @initial_users = initial
          @max_selected_items = max_selected_items
          @focus_on_load = focus_on_load

          yield(self) if block_given?
        end

        def as_json(*)
          {
            type: TYPE,
            placeholder: @placeholder.as_json,
            action_id: @action_id,
            initial_users: @initial_users,
            focus_on_load: @focus_on_load,
            confirm: confirm&.as_json,
            max_selected_items: @max_selected_items
          }.compact
        end
      end
    end
  end
end
