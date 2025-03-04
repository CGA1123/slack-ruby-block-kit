# frozen_string_literal: true

module Slack
  module BlockKit
    module Element
      # A radio button group that allows a user to choose one item from a list of possible options.
      #
      # https://api.slack.com/reference/messaging/block-elements#radio
      class RadioButtons
        include Composition::ConfirmationDialog::Confirmable

        TYPE = 'radio_buttons'

        attr_accessor :options

        def initialize(action_id:, focus_on_load: nil)
          @action_id = action_id
          @focus_on_load = focus_on_load
          @options = []

          yield(self) if block_given?
        end

        def option(value:, text:, description: nil, initial: false, emoji: nil)
          option = Composition::Option.new(
            value: value,
            text: text,
            description: description,
            initial: initial,
            emoji: emoji
          )

          @options << option

          self
        end

        def as_json(*)
          {
            type: TYPE,
            action_id: @action_id,
            focus_on_load: @focus_on_load,
            options: @options.map(&:as_json),
            initial_option: initial_option&.as_json,
            confirm: confirm&.as_json
          }.compact
        end

        private

        def initial_option
          @options&.find(&:initial?)
        end
      end
    end
  end
end
