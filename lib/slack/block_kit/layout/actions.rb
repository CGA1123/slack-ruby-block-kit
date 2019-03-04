# frozen_string_literal: true

module Slack
  module BlockKit
    module Layout

      # A block that is used to hold interactive elements.
      #
      # https://api.slack.com/reference/messaging/blocks#actions
      class Actions
        TYPE = 'actions'

        attr_accessor :elements

        def initialize(block_id: nil)
          @block_id = block_id
          @elements = []

          yield(self) if block_given?
        end

        def button(text:, action_id:, emoji: nil, url: nil, value: nil)
          element = Element::Button.new(
            text: text,
            action_id: action_id,
            emoji: emoji,
            url: url,
            value: value
          )

          yield(element) if block_given?

          append(element)
        end

        def channel_select(placeholder:, action_id:, initial: nil, emoji: nil)
          element = Element::ChannelsSelect.new(
            placholder: placehloder,
            action_id: action_id,
            initial: initial,
            emoji: emoji
          )

          yield(element) if block_given?

          append(element)
        end

        def converstation_select(placeholder:, action_id:, initial: nil, emoji: nil)
          element = Element::ConversationsSelect.new(
            placholder: placeholder,
            action_id: action_id,
            initial: initial,
            emoji: emoji
          )

          yield(element) if block_given?

          append(element)
        end

        def date_picker(action_id:, placeholder: nil, initial: nil, emoji: nil)
          element = Element::DatePicker.new(
            placholder: placeholder,
            action_id: action_id,
            initial: initial,
            emoji: emoji
          )

          yield(element) if block_given?

          append(element)
        end

        def external_select(placeholder:, action_id:, initial: nil, min_query_length: nil, emoji: nil)
          element = Element::ExternalSelect.new(
            placeholder: placeholder,
            action_id: action_id,
            initial: initial,
            min_query_length: min_query_length,
            emoji: emoji
          )

          yield(element) if block_given?

          append(element)
        end

        def overflow_menu(action_id:)
          element = Element::OverflowMenu.new(action_id: action_id)

          yield(element) if block_given?

          append(element)
        end

        def static_select(placeholder:, action_id:, emoji: nil)
          element = Element::StaticSelect.new(
            placeholder: placeholder,
            action_id: action_id,
            emoji: emoji
          )

          yield(element) if block_given?

          append(element)
        end

        def users_select(placeholder:, action_id:, initial: nil, emoji: nil)
          element = Element::UsersSelect.new(
            placeholder: placeholder,
            action_id: action_id,
            emoji: emoji,
            initial: initial
          )

          yield(element) if block_given?

          append(element)
        end

        def append(element)
          @elements << element

          self
        end

        def as_json(*)
          {
            type: TYPE,
            elements: @elements.map(&:as_json),
            block_id: @block_id
          }.compact
        end
      end
    end
  end
end
