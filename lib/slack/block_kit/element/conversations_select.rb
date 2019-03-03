# frozen_string_literal: true

module Slack
  module BlockKit
    module Element
      class ConversationsSelect
        TYPE = 'conversations_select'

        def initialize(placeholder:, action_id:, initial_conversation: nil, confirm: nil)
          @placeholder = placeholder
          @action_id = action_id
          @initial_conversation = initial_conversation
          @confirm = confirm
        end

        def as_json(*)
          {
            type: TYPE,
            placeholder: @placeholder.as_json,
            action_id: @action_id,
            initial_conversation: @initial_conversation,
            confirm: @confirm&.as_json
          }
        end
      end
    end
  end
end
