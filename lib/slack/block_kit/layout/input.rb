# frozen_string_literal: true

module Slack
  module BlockKit
    module Layout
      # A block that collects information from users - it can hold a plain-text
      # input element, a select menu element, a multi-select menu element, or a
      # datepicker.
      #
      # https://api.slack.com/reference/block-kit/blocks#input
      class Input
        TYPE = 'input'

        attr_accessor :label, :element, :block_id, :hint, :optional, :emoji

        def initialize(
          label:,
          element:,
          block_id: nil,
          hint: nil,
          optional: nil,
          emoji: nil
        )
          @label = Composition::PlainText.new(text: label, emoji: emoji) if label
          @hint = Composition::PlainText.new(text: hint, emoji: emoji) if hint
          @block_id = block_id
          @optional = optional
          @element = element
        end

        def as_json(*)
          {
            type: TYPE,
            element: @element.as_json,
            label: @label&.as_json,
            hint: @hint&.as_json,
            block_id: @block_id,
            optional: optional
          }.compact
        end
      end
    end
  end
end
