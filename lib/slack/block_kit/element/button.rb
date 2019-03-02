# frozen_string_literal: true

module Slack
  module BlockKit
    module Element
      class Button
        TYPE = 'button'

        def initialize(text:, action_id:, url: nil, value: nil, confirm: nil)
          @text = text
          @action_id = action_id
          @url = url
          @value = value
          @confirm = confirm
        end

        def to_h
          {
            type: TYPE,
            text: @text.to_h,
            action_id: @action_id,
            url: @url,
            value: @value,
            confirm: @confirm&.to_h
          }.compact
        end
      end
    end
  end
end
