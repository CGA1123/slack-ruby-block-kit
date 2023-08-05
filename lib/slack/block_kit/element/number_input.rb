# frozen_string_literal: true

module Slack
  module BlockKit
    module Element
      # Works with block types: Input
      #
      # Number input elements are supported in the following app surfaces:
      # Modals
      #
      # This input elements accepts both whole and decimal numbers. For
      # example, 0.25, 5.5, and -10 are all valid input values. Decimal
      # numbers are only allowed when is_decimal_allowed is equal to true.
      #
      # https://api.slack.com/reference/block-kit/block-elements#number
      class NumberInput
        TYPE = 'number_input'

        def initialize(
          action_id:,
          is_decimal_allowed:,
          placeholder: nil,
          initial_value: nil,
          min_value: nil,
          max_value: nil,
          focus_on_load: nil
        )
          @placeholder = placeholder && Composition::PlainText.new(text: placeholder)
          @initial_value = initial_value
          @action_id = action_id
          @is_decimal_allowed = is_decimal_allowed
          @focus_on_load = focus_on_load
          @dispatch_action_config = nil
          @min_value = min_value
          @max_value = max_value
        end

        def dispatch_action_config(triggers: nil)
          @dispatch_action_config = Composition::DispatchActionConfiguration.new(triggers: triggers)

          yield(@dispatch_action_config) if block_given?

          self
        end

        def as_json(*)
          {
            type: TYPE,
            action_id: @action_id,
            is_decimal_allowed: @is_decimal_allowed,
            placeholder: @placeholder&.as_json,
            initial_value: @initial_value,
            min_value: @min_value,
            max_value: @max_value,
            focus_on_load: @focus_on_load,
            dispatch_action_config: @dispatch_action_config&.as_json
          }.compact
        end
      end
    end
  end
end
