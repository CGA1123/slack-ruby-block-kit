# frozen_string_literal: true

module Slack
  module BlockKit
    module Element
      class UsersSelect
        TYPE = 'users_select'

        attr_accessor :confirm

        def initialize(placeholder:, action_id:, initial: nil, emoji: nil)
          @placeholder = Composition::PlainText.new(text: placeholder, emoji: emoji)
          @action_id = action_id
          @initial_user = initial

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
            initial_user: @initial_user,
            confirm: @confirm&.as_json
          }.compact
        end
      end
    end
  end
end
