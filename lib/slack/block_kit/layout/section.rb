# frozen_string_literal: true

require_relative './section/multi_select_elements'

module Slack
  module BlockKit
    module Layout
      # A section is one of the most flexible blocks available - it can be used
      # as a simple text block, in combination with text fields, or side-by-side
      # with any of the available block elements.
      #
      # https://api.slack.com/reference/messaging/blocks#section
      class Section
        include Section::MultiSelectElements
        TYPE = 'section'

        attr_accessor :fields, :text, :accessory

        def initialize(block_id: nil)
          @block_id = block_id
          @fields = nil
          @accessory = nil

          yield(self) if block_given?
        end

        def plaintext_field(text:, emoji: nil)
          @fields ||= []

          @fields << Composition::PlainText.new(text: text, emoji: emoji)

          self
        end

        def mrkdwn_field(text:, verbatim: nil)
          @fields ||= []

          @fields << Composition::Mrkdwn.new(text: text, verbatim: verbatim)

          self
        end

        def plain_text(text:, emoji: nil)
          @text = Composition::PlainText.new(text: text, emoji: emoji)

          self
        end

        def mrkdwn(text:, verbatim: nil)
          @text = Composition::Mrkdwn.new(text: text, verbatim: verbatim)

          self
        end

        def button(text:, action_id:, style: nil, emoji: nil, url: nil, value: nil)
          element = Element::Button.new(
            text: text,
            action_id: action_id,
            style: style,
            emoji: emoji,
            url: url,
            value: value
          )

          yield(element) if block_given?

          accessorise(element)
        end

        def channel_select(placeholder:, action_id:, initial: nil, emoji: nil)
          element = Element::ChannelsSelect.new(
            placeholder: placeholder,
            action_id: action_id,
            initial: initial,
            emoji: emoji
          )

          yield(element) if block_given?

          accessorise(element)
        end

        def conversation_select(placeholder:, action_id:, initial: nil, emoji: nil)
          element = Element::ConversationsSelect.new(
            placeholder: placeholder,
            action_id: action_id,
            initial: initial,
            emoji: emoji
          )

          yield(element) if block_given?

          accessorise(element)
        end

        def date_picker(action_id:, placeholder: nil, initial: nil, emoji: nil)
          element = Element::DatePicker.new(
            placeholder: placeholder,
            action_id: action_id,
            initial: initial,
            emoji: emoji
          )

          yield(element) if block_given?

          accessorise(element)
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

          accessorise(element)
        end

        def overflow_menu(action_id:)
          element = Element::OverflowMenu.new(action_id: action_id)

          yield(element) if block_given?

          accessorise(element)
        end

        def static_select(placeholder:, action_id:, emoji: nil)
          element = Element::StaticSelect.new(
            placeholder: placeholder,
            action_id: action_id,
            emoji: emoji
          )

          yield(element) if block_given?

          accessorise(element)
        end

        def users_select(placeholder:, action_id:, initial: nil, emoji: nil)
          element = Element::UsersSelect.new(
            placeholder: placeholder,
            action_id: action_id,
            emoji: emoji,
            initial: initial
          )

          yield(element) if block_given?

          accessorise(element)
        end

        def checkboxes(action_id:)
          element = Element::Checkboxes.new(
            action_id: action_id
          )

          yield(element) if block_given?

          accessorise(element)
        end

        def radio_buttons(action_id:)
          element = Element::RadioButtons.new(
            action_id: action_id
          )

          yield(element) if block_given?

          accessorise(element)
        end

        def image(url:, alt_text:)
          accessorise(Element::Image.new(image_url: url, alt_text: alt_text))
        end

        def accessorise(element)
          @accessory = element

          self
        end

        def as_json(*)
          {
            type: TYPE,
            text: @text.as_json,
            block_id: @block_id,
            fields: @fields&.map(&:as_json),
            accessory: @accessory&.as_json
          }.compact
        end
      end
    end
  end
end
