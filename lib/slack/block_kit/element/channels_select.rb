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

        def to_h
          {
            type: TYPE,
            placeholder: @placeholder.to_h,
            action_id: @action_id,
            initial_conversation: @initial_channel,
            confirm: @confirm&.to_h
          }
        end
      end
    end
  end
end
