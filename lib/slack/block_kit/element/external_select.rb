# frozen_string_literal: true

module Slack
  module BlockKit
    module Element
      class ExternalSelect
        TYPE = 'external_select'

        def initialize(placeholder:, action_id:, initial_option: nil, min_query_length: nil, confirm: nil)
          @placeholder = placeholder
          @action_id = action_id
          @initial_option = initial_option
          @min_query_length = min_query_length
          @confirm = confirm
        end

        def as_json(*)
          {
            type: TYPE,
            placeholder: @placeholder.as_json,
            action_id: @action_id,
            initial_option: @initial_option&.as_json,
            min_query_length: min_query_length,
            confirm: @confirm&.as_json
          }.compact
        end
      end
    end
  end
end
