# frozen_string_literal: true

module Slack
  module BlockKit
    module Element
      class OverflowMenu
        TYPE = 'overflow'

        def initialize(action_id:, options:, confirm: nil)
          @action_id = action_id
          @options = options
          @confirm = confirm
        end

        def to_h
          {
            type: TYPE,
            action_id: @action_id,
            options: @options.map(&:to_h),
            confirm: @confirm&.to_h
          }.compact
        end
      end
    end
  end
end
