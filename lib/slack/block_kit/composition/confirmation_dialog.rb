# frozen_string_literal: true

module Slack
  module BlockKit
    module Composition
      # An object that defines a dialog that provides a confirmation step to any
      # interactive element. This dialog will ask the user to confirm their
      # action by offering confirm and deny buttons.
      #
      # https://api.slack.com/reference/messaging/composition-objects#confirm
      class ConfirmationDialog
        def title(text:, emoji: nil)
          @title = PlainText.new(text: text, emoji: emoji)

          self
        end

        def confirm(text:, emoji: nil)
          @confirm = PlainText.new(text: text, emoji: emoji)

          self
        end

        def deny(text:, emoji: nil)
          @deny = PlainText.new(text: text, emoji: emoji)

          self
        end

        def plain_text(text:, emoji: nil)
          @text = PlainText.new(text: text, emoji: emoji)

          self
        end

        def style(value)
          @style = value

          self
        end

        def mrkdwn(text:, verbatim: nil)
          @text = Mrkdwn.new(text: text, verbatim: verbatim)

          self
        end

        def as_json(*)
          {
            title: @title.as_json,
            text: @text.as_json,
            confirm: @confirm.as_json,
            deny: @deny.as_json,
            style: @style
          }.compact
        end
      end
    end
  end
end
