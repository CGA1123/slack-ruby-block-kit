# frozen_string_literal: true

module Slack
  module BlockKit
    module Composition
      # Provides a way to group options in a select menu.
      #
      # https://api.slack.com/reference/messaging/composition-objects#option-group
      # https://api.slack.com/reference/messaging/block-elements#select
      class OptionGroup
        attr_accessor :options

        def initialize(label:, emoji: nil)
          @label = PlainText.new(text: label, emoji: emoji)
          @options = []

          yield(self) if block_given?
        end

        def option(text:, value:, emoji: nil)
          @options << Option.new(text: text, value: value, emoji: emoji)

          self
        end

        def as_json(*)
          {
            label: @label.as_json,
            options: @options.map(&:as_json)
          }
        end
      end
    end
  end
end
