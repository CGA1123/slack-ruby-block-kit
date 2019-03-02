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

        def to_h
          {
            type: TYPE,
            placeholder: @placeholder.to_h,
            action_id: @action_id,
            initial_conversation: @initial_conversation,
            confirm: @confirm&.to_h
          }
        end
      end
    end
  end
end
