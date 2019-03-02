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

        def to_h
          {
            type: TYPE,
            placeholder: @placeholder.to_h,
            action_id: @action_id,
            initial_option: @initial_option&.to_h,
            min_query_length: min_query_length,
            confirm: @confirm&.to_h
          }.compact
        end
      end
    end
  end
end
