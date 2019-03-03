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

        def as_json(*)
          {
            type: TYPE,
            action_id: @action_id,
            options: @options.map(&:as_json),
            confirm: @confirm&.as_json
          }.compact
        end
      end
    end
  end
end
