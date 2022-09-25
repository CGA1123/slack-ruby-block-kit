# frozen_string_literal: true

module Slack
  module BlockKit
    module Element
      # An element which allows selection of a time of day.
      #
      # On desktop clients, this time picker will take the form of a dropdown
      # list with free-text entry for precise choices. On mobile clients, the
      # time picker will use native time picker UIs.
      #
      # https://api.slack.com/reference/block-kit/block-elements#timepicker
      class Timepicker
        include Composition::ConfirmationDialog::Confirmable

        TYPE = 'timepicker'

        def initialize(action_id:, placeholder: nil, initial: nil, emoji: nil, focus_on_load: nil)
          @placeholder = placeholder_text(placeholder, emoji) if placeholder
          @initial_time = initial
          @action_id = action_id
          @focus_on_load = focus_on_load

          yield(self) if block_given?
        end

        def as_json(*)
          {
            type: TYPE,
            action_id: @action_id,
            placeholder: @placeholder&.as_json,
            initial_time: @initial_time,
            focus_on_load: @focus_on_load,
            confirm: confirm&.as_json
          }.compact
        end

        private

        def placeholder_text(text, emoji)
          return unless text

          Composition::PlainText.new(text: text, emoji: emoji)
        end
      end
    end
  end
end
