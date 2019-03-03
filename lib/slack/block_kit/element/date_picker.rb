# frozen_string_literal: true

module Slack
  module BlockKit
    module Element
      class DatePicker
        TYPE = 'datepicker'

        def initialize(action_id:, placeholder: nil, initial_date: nil, confirm: nil)
          @action_id = action_id
          @placeholder = placeholder
          @initial_date = initial_date
          @confirm = confirm
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
