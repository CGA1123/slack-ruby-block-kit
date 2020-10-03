# frozen_string_literal: true

module Slack
  module BlockKit
    module Element
      # A radio button group that allows a user to choose one item from a list of possible options.
      #
      # https://api.slack.com/reference/messaging/block-elements#radio
      class RadioButtons
        TYPE = 'radio_buttons'

        attr_accessor :options, :initial_option, :confirm

        def initialize(action_id:)
          @action_id = action_id

          yield(self) if block_given?
        end

        def confirmation_dialog
          @confirm = Composition::ConfirmationDialog.new

          yield(@confirm) if block_given?

          self
        end

        def option(value:, text:, initial: false)
          option = Composition::Option.new(
            value: value,
            text: text
          )

          @options ||= []
          @options << option

          @initial_option = option if initial

          self
        end

        def as_json(*)
          {
            type: TYPE,
            action_id: @action_id,
            options: @options&.map(&:as_json),
            initial_option: @initial_option&.as_json,
            confirm: @confirm&.as_json
          }.compact
        end
      end
    end
  end
end
