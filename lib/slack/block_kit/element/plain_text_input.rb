# frozen_string_literal: true

module Slack
  module BlockKit
    module Element
      # A plain-text input, similar to the HTML <input> tag, creates a field
      # where a user can enter freeform data. It can appear as a single-line
      # field or a larger textarea using the multiline flag.
      #
      # Plain-text input elements are currently only available in modals
      #
      # https://api.slack.com/reference/block-kit/block-elements#input
      class PlainTextInput
        TYPE = 'plain_text_input'

        def initialize(
          action_id:,
          placeholder: nil,
          emoji: nil,
          initial_value: nil,
          multiline: nil,
          min_length: nil,
          max_length: nil
        )
          @placeholder = placeholder && Composition::PlainText.new(text: placeholder, emoji: emoji)
          @initial_value = initial_value
          @action_id = action_id
          @multiline = multiline
          @min_length = min_length
          @max_length = max_length
          @dispatch_action_config = nil
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
            placeholder: @placeholder&.as_json,
            multiline: @multiline,
            min_length: @min_length,
            max_length: @max_length,
            initial_value: @initial_value,
            dispatch_action_config: @dispatch_action_config&.as_json
          }.compact
        end
      end
    end
  end
end
