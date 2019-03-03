# frozen_string_literal: true

module Slack
  module BlockKit
    module Element
      class StaticSelect
        TYPE = 'static_select'

        def initialize(placeholder:, action_id:, options:, option_groups:, initial_option: nil, confirm: nil)
          @placeholder = placeholder
          @action_id = action_id
          @options = options
          @option_groups = option_groups
          @initial_option = initial_option
          @confirm = confirm
        end

        def as_json(*)
          {
            type: TYPE,
            placeholder: @placeholder.as_json,
            action_id: @action_id,
            options: @options&.map(&:as_json),
            option_groups: @option_groups&.map(&:as_json),
            initial_option: @initial_option&.as_json,
            confirm: @confirm&.as_json
          }.compact
        end
      end
    end
  end
end
