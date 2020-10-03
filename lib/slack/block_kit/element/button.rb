# frozen_string_literal: true

module Slack
  module BlockKit
    module Element
      # An interactive element that inserts a button.
      # The button can be a trigger for anything from opening a simple link
      # to starting a complex workflow.
      #
      # https://api.slack.com/reference/messaging/block-elements#button
      class Button
        include Composition::ConfirmationDialog::Confirmable

        TYPE = 'button'

        def initialize(text:, action_id:, style: nil, emoji: nil, url: nil, value: nil)
          @text = Composition::PlainText.new(text: text, emoji: emoji)
          @action_id = action_id
          @url = url
          @style = style
          @value = value

          yield(self) if block_given?
        end

        def as_json(*)
          {
            type: TYPE,
            text: @text.as_json,
            action_id: @action_id,
            url: @url,
            value: @value,
            style: @style,
            confirm: confirm&.as_json
          }.compact
        end
      end
    end
  end
end
