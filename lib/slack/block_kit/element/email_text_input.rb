# frozen_string_literal: true

module Slack
  module BlockKit
    module Element
      # A Email input element, similar to the Plain-text input element, creates
      # a single line field where a user can enter an email. It can appear as a
      # single-line field.
      #
      # https://api.slack.com/reference/block-kit/block-elements#email
      class EmailTextInput
        TYPE = 'email_text_input'

        def initialize(
          action_id:,
          placeholder: nil,
          initial_value: nil,
          focus_on_load: nil
        )
          @placeholder = placeholder && Composition::PlainText.new(text: placeholder)
          @initial_value = initial_value
          @action_id = action_id
          @focus_on_load = focus_on_load
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
            initial_value: @initial_value,
            focus_on_load: @focus_on_load,
            dispatch_action_config: @dispatch_action_config&.as_json
          }.compact
        end
      end
    end
  end
end
