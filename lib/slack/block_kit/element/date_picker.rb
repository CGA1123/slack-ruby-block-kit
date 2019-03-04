# frozen_string_literal: true

module Slack
  module BlockKit
    module Element
      # An element which lets users easily select a date from a calendar style
      # UI.
      #
      # Date picker elements can be used inside of section and actions blocks.
      #
      # https://api.slack.com/reference/messaging/block-elements#datepicker
      class DatePicker
        TYPE = 'datepicker'

        def initialize(action_id:, placeholder: nil, initial: nil, emoji: nil)
          @action_id = action_id
          @initial_date = initial
          if placeholder
            @placeholder = Composition::PlainText.new(
              text: placeholder,
              emoji: emoji
            )
          end

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
            action_id: @action_id,
            placeholder: @placeholder&.as_json,
            initial_date: @initial_date,
            confirm: @confirm&.as_json
          }.compact
        end
      end
    end
  end
end
