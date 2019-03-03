# frozen_string_literal: true

module Slack
  module BlockKit
    module Element
      class ChannelsSelect
        TYPE = 'channels_select'

        def initialize(placeholder:, action_id:, initial_channel: nil, confirm: nil)
          @placeholder = placeholder
          @action_id = action_id
          @initial_conversation = initial_channel
          @confirm = confirm
        end

        def as_json(*)
          {
            type: TYPE,
            placeholder: @placeholder.as_json,
            action_id: @action_id,
            initial_conversation: @initial_channel,
            confirm: @confirm&.as_json
          }
        end
      end
    end
  end
end
