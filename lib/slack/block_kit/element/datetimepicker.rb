# frozen_string_literal: true

module Slack
  module BlockKit
    module Element
      # An element that allows the selection of both a date and a time of day
      # formatted as a UNIX timestamp.
      #
      # On desktop clients, the time picker will take the form of a dropdown
      # list and the date picker will take the form of a dropdown calendar.
      # Both options will have free-text entry for precise choices. On mobile
      # clients, the time picker and date picker will use native UIs.
      #
      # https://api.slack.com/reference/block-kit/block-elements#datetimepicker
      class Datetimepicker
        include Composition::ConfirmationDialog::Confirmable

        TYPE = 'datetimepicker'

        def initialize(action_id:, initial: nil, focus_on_load: nil)
          @action_id = action_id
          @initial_datetime = initial
          @focus_on_load = focus_on_load

          yield(self) if block_given?
        end

        def as_json(*)
          {
            type: TYPE,
            action_id: @action_id,
            initial_date_time: @initial_datetime,
            focus_on_load: @focus_on_load,
            confirm: confirm&.as_json
          }.compact
        end
      end
    end
  end
end
