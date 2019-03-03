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

        def as_json(*)
          {
            type: TYPE,
            text: @text.as_json,
            action_id: @action_id,
            url: @url,
            value: @value,
            confirm: @confirm&.as_json
          }.compact
        end
      end
    end
  end
end
