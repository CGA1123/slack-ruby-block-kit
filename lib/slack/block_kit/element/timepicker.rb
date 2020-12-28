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

        def initialize(action_id:)
          @placeholder, @initial_time = nil
          @action_id = action_id

          yield(self) if block_given?
        end

        def placeholder(text:, emoji: nil)
          @placeholder = Composition::PlainText.new(text: text, emoji: emoji)

          self
        end

        def initial_time(time_str)
          @initial_time = time_str

          self
        end

        def as_json(*)
          {
            type: TYPE,
            action_id: @action_id,
            placeholder: @placeholder&.as_json,
            initial_time: @initial_time,
            confirm: confirm&.as_json
          }.compact
        end
      end
    end
  end
end
