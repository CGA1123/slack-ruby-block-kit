# frozen_string_literal: true

module Slack
  module BlockKit
    module Element

      # A select menu, just as with a standard HTML <select> tag, creates a drop
      # down menu with a list of options for a user to choose. The select menu
      # also includes type-ahead functionality, where a user can type a part or
      # all of an option string to filter the list.
      #
      # This select menu will load its options from an external data source,
      # allowing for a dynamic list of options.
      #
      # Each time a select menu of this type is opened or the user starts typing
      # in the typeahead field, we'll send a request to your specified URL. Your
      # app should return an HTTP 200 OK response, along with an
      # application/json post body with an object containing either an options
      # array, or an option_groups array.
      #
      # https://api.slack.com/reference/messaging/block-elements#external-select
      class ExternalSelect
        TYPE = 'external_select'

        attr_accessor :confirm

        def initialize(placeholder:, action_id:, initial: nil, min_query_length: nil, emoji: nil)
          @placeholder = Composition::PlainText.new(text: placeholder, emoji: emoji)
          @action_id = action_id
          @initial_option = initial
          @min_query_length = min_query_length

          yield(self) if block_given?
        end

        def confirmation_dialog
          @confirm = Composition::ConfirmationDialog.new

          yield(@confirm) if block_given?

          self
        end

        def as_json(*)
          {
            type: TYPE,
            placeholder: @placeholder.as_json,
            action_id: @action_id,
            initial_option: @initial_option&.as_json,
            min_query_length: min_query_length,
            confirm: @confirm&.as_json
          }.compact
        end
      end
    end
  end
end
