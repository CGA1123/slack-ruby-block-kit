# frozen_string_literal: true

module Slack
  module BlockKit
    module Element
      # This is like a cross between a button and a select menu - when a user
      # clicks on this overflow button, they will be presented with a list of
      # options to choose from. Unlike the select menu, there is no typeahead
      # field, and the button always appears with an ellipsis ("…") rather than
      # customisable text.
      #
      # As such, it is usually used if you want a more compact layout than a
      # select menu, or to supply a list of less visually important actions
      # after a row of buttons.
      #
      # https://api.slack.com/reference/messaging/block-elements#overflow
      class OverflowMenu
        TYPE = 'overflow'

        attr_accessor :options, :confirm

        def initialize(action_id:)
          @action_id = action_id
          @options = []

          yield(self) if block_given?
        end

        def option(value:, text:, emoji: nil, url: nil)
          @options << Composition::Option.new(
            value: value,
            text: text,
            emoji: emoji,
            url: url
          )

          self
        end

        def confirmation_dialog
          @confirm = Composition::ConfirmationDialog.new

          yield(@confirm) if block_given?

          self
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
