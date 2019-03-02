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

        def to_h
          {
            type: TYPE,
            placeholder: @placeholder.to_h,
            action_id: @action_id,
            options: @options&.map(&:to_h),
            option_groups: @option_groups&.map(&:to_h),
            initial_option: @initial_option&.to_h,
            confirm: @confirm&.to_h
          }.compact
        end
      end
    end
  end
end
