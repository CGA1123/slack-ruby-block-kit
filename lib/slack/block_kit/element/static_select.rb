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
      # https://api.slack.com/reference/messaging/block-elements#static-select
      class StaticSelect
        include Composition::ConfirmationDialog::Confirmable

        TYPE = 'static_select'

        attr_accessor :options, :option_groups

        def initialize(placeholder:, action_id:, emoji: nil, focus_on_load: nil)
          @placeholder = Composition::PlainText.new(text: placeholder, emoji: emoji)
          @action_id = action_id
          @focus_on_load = focus_on_load

          yield(self) if block_given?
        end

        def option(value:, text:, description: nil, initial: false, emoji: nil)
          @options ||= []
          @options << Composition::Option.new(
            value: value,
            text: text,
            description: description,
            emoji: emoji,
            initial: initial
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

        def as_json(*)
          {
            type: TYPE,
            placeholder: @placeholder.as_json,
            action_id: @action_id,
            focus_on_load: @focus_on_load,
            options: options&.map(&:as_json),
            option_groups: option_groups&.map(&:as_json),
            initial_option: initial_option&.as_json,
            confirm: confirm&.as_json
          }.compact
        end

        private

        def initial_option
          opts = options || option_groups&.flat_map(&:options)

          return unless opts

          opts.find(&:initial?)
        end
      end
    end
  end
end
