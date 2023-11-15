# frozen_string_literal: true

module Slack
  module BlockKit
    module Limits
      module Limiters
        class OptionTruncateLabelAndDescriptionLimiter < NoopLimiter
          include Limits::TruncationHelper

          attr_reader :max_label_length, :max_value_length, :max_description_length, :label_truncation_replacement, :description_truncation_replacement

          def initialize(max_label_length: MAX_OPTION_TEXT_LENGTH, max_value_length: MAX_OPTION_VALUE_LENGTH, max_description_length: MAX_OPTION_DESCRIPTION_LENGTH, label_truncation_replacement: '…', description_truncation_replacement: '…')
            super()
            @max_label_length = max_label_length
            @max_value_length = max_value_length
            @max_description_length = max_description_length
            @label_truncation_replacement = label_truncation_replacement
            @description_truncation_replacement = description_truncation_replacement
          end

          def call(option_json)
            raise Errors::LimitExceededError, "Option values must be less than #{max_value_length} in size. Given value has size #{option_json[:value].size}" if option_json[:value].size > max_value_length

            truncate_label!(option_json)
            truncate_description!(option_json)

            super(option_json)
          end

          private

          def truncate_label!(option_json)
            option_json[:text][:text] = truncate_string(option_json[:text][:text], max_label_length, omission: label_truncation_replacement)
          end

          def truncate_description!(option_json)
            option_json[:description][:text] = truncate_string(option_json[:description][:text], max_description_length, omission: description_truncation_replacement) unless option_json[:description].nil?
          end
        end
      end
    end
  end
end
