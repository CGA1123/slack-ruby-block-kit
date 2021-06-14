# frozen_string_literal: true

module Slack
  module BlockKit
    module Composition
      # Determines when a plain-text input element will return a block_actions
      # interaction payload.
      #
      # @param [Array] triggers - values for the `trigger_actions_on` array
      #
      # https://api.slack.com/reference/block-kit/composition-objects#dispatch_action_config
      # https://api.slack.com/reference/block-kit/block-elements#input
      class DispatchActionConfiguration
        def initialize(triggers: nil)
          @triggers = triggers || []
        end

        def trigger_on_enter_pressed
          @triggers << :on_enter_pressed
        end

        def trigger_on_character_entered
          @triggers << :on_character_entered
        end

        def as_json(*)
          {
            trigger_actions_on: @triggers.uniq
          }.compact
        end
      end
    end
  end
end
