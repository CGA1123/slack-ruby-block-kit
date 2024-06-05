# frozen_string_literal: true

module Slack
  module BlockKit
    module Limits
      module Limiters
        class StaticSelectOptionsConfigRaiseOnErrorLimiter < NoopLimiter
          attr_reader :max_options

          def initialize(max_options: MAX_STATIC_SELECT_OPTIONS)
            super()
            @max_options = max_options
          end

          def call(static_select_json)
            check_one_of_options_or_option_groups_is_set!(static_select_json)
            check_not_both_options_and_option_groups_are_set!(static_select_json)

            check_options!(static_select_json) unless static_select_json[:options].nil?

            super(static_select_json)
          end

          private

          def check_one_of_options_or_option_groups_is_set!(static_select_json)
            raise Errors::IncompatibleOptionsError.new("Either 'options' or 'option_groups' must have items. Both are empty.", parameter_names: %w[options option_groups]) if static_select_json[:options]&.empty? && static_select_json[:option_groups]&.empty?
          end

          def check_not_both_options_and_option_groups_are_set!(static_select_json)
            raise Errors::IncompatibleOptionsError, "'options' and 'option_groups' cannot both be set" if !(static_select_json[:options].nil? || static_select_json[:options].empty?) && !(static_select_json[:option_groups].nil? || static_select_json[:option_groups].empty?)
          end

          def check_options!(static_select_json)
            # TODO: Check that 'initial' is one of the options

            raise Errors::LimitExceededError, "Static select elements are limited to #{max_options} options. #{static_select_json[:options].size} options provided" if static_select_json[:options].size > max_options
          end
        end
      end
    end
  end
end
