# frozen_string_literal: true

module Slack
  module BlockKit
    module Layout
      # A block that collects information from users - it can hold a plain-text
      # input element, a checkbox element, a radio button element,
      # a select menu element, a multi-select menu element, or a datepicker.
      #
      # https://api.slack.com/reference/block-kit/blocks#input
      class Input # rubocop:disable Metrics/ClassLength
        TYPE = 'input'

        attr_accessor :label, :element, :block_id, :hint, :optional, :emoji

        def initialize(
          label:,
          element: nil,
          block_id: nil,
          hint: nil,
          optional: nil,
          emoji: nil,
          dispatch_action: nil
        )
          @label = Composition::PlainText.new(text: label, emoji: emoji) if label
          @hint = Composition::PlainText.new(text: hint, emoji: emoji) if hint
          @block_id = block_id
          @optional = optional
          @element = element
          @dispatch_action = dispatch_action
        end

        def conversation_select(placeholder:, action_id:, initial: nil, emoji: nil, default_to_current_conversation: nil, response_url_enabled: nil)
          @element = Element::ConversationsSelect.new(
            placeholder: placeholder,
            action_id: action_id,
            initial: initial,
            emoji: emoji,
            default_to_current_conversation: default_to_current_conversation,
            response_url_enabled: response_url_enabled
          )

          yield(@element) if block_given?

          self
        end

        def multi_conversations_select(placeholder:, action_id:, initial: nil, emoji: nil, max_selected_items: nil, default_to_current_conversation: nil)
          @element = Element::MultiConversationsSelect.new(
            placeholder: placeholder,
            action_id: action_id,
            initial: initial,
            emoji: emoji,
            max_selected_items: max_selected_items,
            default_to_current_conversation: default_to_current_conversation
          )

          yield(@element) if block_given?

          self
        end

        def channels_select(placeholder:, action_id:, initial: nil, emoji: nil, response_url_enabled: nil)
          @element = Element::ChannelsSelect.new(
            placeholder: placeholder,
            action_id: action_id,
            initial: initial,
            emoji: emoji,
            response_url_enabled: response_url_enabled
          )

          yield(@element) if block_given?

          self
        end

        def checkboxes(action_id:)
          @element = Element::Checkboxes.new(action_id: action_id)

          yield(@element) if block_given?

          self
        end

        def datepicker(action_id:, placeholder: nil, initial: nil, emoji: nil)
          @element = Element::Datepicker.new(
            action_id: action_id,
            placeholder: placeholder,
            initial: initial,
            emoji: emoji
          )

          yield(@element) if block_given?

          self
        end

        def timepicker(action_id:, placeholder: nil, initial: nil, emoji: nil)
          @element = Element::Timepicker.new(
            action_id: action_id,
            placeholder: placeholder,
            emoji: emoji,
            initial: initial
          )

          yield(@element) if block_given?

          self
        end

        def datetimepicker(action_id:, initial: nil)
          @element = Element::Datetimepicker.new(
            action_id: action_id,
            initial: initial
          )

          yield(@element) if block_given?

          self
        end

        def multi_channels_select(placeholder:, action_id:, initial: nil, emoji: nil, max_selected_items: nil)
          @element = Element::MultiChannelsSelect.new(
            placeholder: placeholder,
            action_id: action_id,
            initial: initial,
            emoji: emoji,
            max_selected_items: max_selected_items
          )

          yield(@element) if block_given?

          self
        end

        def static_select(placeholder:, action_id:, emoji: nil)
          @element = Element::StaticSelect.new(
            placeholder: placeholder,
            action_id: action_id,
            emoji: emoji
          )

          yield(@element) if block_given?

          self
        end

        def multi_static_select(placeholder:, action_id:, emoji: nil, max_selected_items: nil)
          @element = Element::MultiStaticSelect.new(
            placeholder: placeholder,
            action_id: action_id,
            emoji: emoji,
            max_selected_items: max_selected_items
          )

          yield(@element) if block_given?

          self
        end

        def external_select(placeholder:, action_id:, initial: nil, min_query_length: nil, emoji: nil)
          @element = Element::ExternalSelect.new(
            placeholder: placeholder,
            action_id: action_id,
            initial: initial,
            min_query_length: min_query_length,
            emoji: emoji
          )

          yield(@element) if block_given?

          self
        end

        def multi_external_select(
          placeholder:,
          action_id:,
          initial: nil,
          min_query_length: nil,
          emoji: nil,
          max_selected_items: nil
        )
          @element = Element::MultiExternalSelect.new(
            placeholder: placeholder,
            action_id: action_id,
            initial: initial,
            min_query_length: min_query_length,
            emoji: emoji,
            max_selected_items: max_selected_items
          )

          yield(@element) if block_given?

          self
        end

        def plain_text_input(
          action_id:,
          placeholder: nil,
          emoji: nil,
          initial_value: nil,
          multiline: nil,
          min_length: nil,
          max_length: nil
        )
          @element = Element::PlainTextInput.new(
            action_id: action_id,
            placeholder: placeholder,
            emoji: emoji,
            initial_value: initial_value,
            multiline: multiline,
            min_length: min_length,
            max_length: max_length
          )

          self
        end

        def number_input(
          action_id:,
          placeholder: nil,
          initial_value: nil,
          is_decimal_allowed: nil,
          focus_on_load: nil,
          dispatch_action_config: nil,
          min_value: nil,
          max_value: nil
        )
          @element = Element::PlainTextInput.new(
            action_id: action_id,
            placeholder: placeholder,
            initial_value: initial_value,
            is_decimal_allowed: is_decimal_allowed,
            focus_on_load: focus_on_load,
            min_value: min_value,
            max_value: max_value
          )

          self
        end

        def url_text_input(
          action_id:,
          placeholder: nil,
          initial_value: nil,
          focus_on_load: nil
        )
          @element = Element::UrlTextInput.new(
            action_id: action_id,
            placeholder: placeholder,
            initial_value: initial_value,
            focus_on_load: focus_on_load
          )
        end

        def email_text_input(
          action_id:,
          placeholder: nil,
          initial_value: nil,
          focus_on_load: nil
        )
          @element = Element::EmailTextInput.new(
            action_id: action_id,
            placeholder: placeholder,
            initial_value: initial_value,
            focus_on_load: focus_on_load
          )
        end

        def radio_buttons(action_id:)
          @element = Element::RadioButtons.new(action_id: action_id)

          yield(@element) if block_given?

          self
        end

        def users_select(placeholder:, action_id:, initial: nil, emoji: nil)
          @element = Element::UsersSelect.new(
            placeholder: placeholder,
            action_id: action_id,
            initial: initial,
            emoji: emoji
          )

          yield(@element) if block_given?

          self
        end

        def multi_users_select(placeholder:, action_id:, initial: nil, emoji: nil, max_selected_items: nil)
          @element = Element::MultiUsersSelect.new(
            placeholder: placeholder,
            action_id: action_id,
            initial: initial,
            emoji: emoji,
            max_selected_items: max_selected_items
          )

          yield(@element) if block_given?

          self
        end

        def as_json(*)
          {
            type: TYPE,
            element: @element.as_json,
            label: @label&.as_json,
            hint: @hint&.as_json,
            block_id: @block_id,
            optional: optional,
            dispatch_action: @dispatch_action
          }.compact
        end
      end
    end
  end
end
