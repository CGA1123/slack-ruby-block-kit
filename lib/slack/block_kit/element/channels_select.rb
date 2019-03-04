# frozen_string_literal: true

module Slack
  module BlockKit
    module Element
      # A select menu, just as with a standard HTML <select> tag, creates a drop
      # down menu with a list of options for a user to choose. The select menu
      # also includes type-ahead functionality, where a user can type a part or
      # all of an option string to filter the list.
      #
      # This select menu will populate its options with a list of public
      # channels visible to the current user in the active workspace.
      #
      # https://api.slack.com/reference/messaging/block-elements#channel-select
      class ChannelsSelect
        TYPE = 'channels_select'

        attr_accessor :confirm

        def initialize(placeholder:, action_id:, initial: nil, emoji: nil)
          @placeholder = Composition::PlainText.new(text: placeholder, emoji: emoji)
          @action_id = action_id
          @initial_channel = initial

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
            initial_channel: @initial_channel,
            confirm: @confirm&.as_json
          }.compact
        end
      end
    end
  end
end
