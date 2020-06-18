# frozen_string_literal: true

module Slack
  module BlockKit
    module Element
      # A select menu, just as with a standard HTML <select> tag, creates a drop
      # down menu with a list of options for a user to choose. The select menu
      # also includes type-ahead functionality, where a user can type a part or
      # all of an option string to filter the list.
      #
      # This is the simplest form of select menu, with a static list of options
      # passed in when defining the element.
      #
      # https://api.slack.com/reference/block-kit/block-elements#static_multi_select
      class MultiStaticSelect
        TYPE = 'multi_static_select'

        attr_accessor :confirm, :options, :option_groups, :initial_option

        def initialize(placeholder:, action_id:, emoji: nil, max_selected_items: nil)
          @placeholder = Composition::PlainText.new(text: placeholder, emoji: emoji)
          @action_id = action_id
          @confirm = nil
          @max_selected_items = max_selected_items

          @options = nil
          @option_groups = nil
          @initial_option = nil

          yield(self) if block_given?
        end

        def confirmation_dialog
          @confirm = Composition::ConfirmationDialog.new

          yield(@confirm) if block_given?

          self
        end

        def option(value:, text:, emoji: nil)
          @options ||= []
          @options << Composition::Option.new(
            value: value,
            text: text,
            emoji: emoji
          )

          self
        end

        def option_group(label:, emoji: nil)
          option_group = Composition::OptionGroup.new(label: label, emoji: emoji)

          yield(option_group) if block_given?

          @option_groups ||= []
          @option_groups << option_group

          self
        end

        def initial(value:, text:, emoji: nil)
          @initial_option = Composition::Option.new(
            value: value,
            text: text,
            emoji: emoji
          )

          self
        end

        def as_json(*)
          {
            type: TYPE,
            placeholder: @placeholder.as_json,
            action_id: @action_id,
            options: @options&.map(&:as_json),
            option_groups: @option_groups&.map(&:as_json),
            initial_option: @initial_option&.as_json,
            confirm: @confirm&.as_json,
            max_selected_items: @max_selected_items
          }.compact
        end
      end
    end
  end
end
