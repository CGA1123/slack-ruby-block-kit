# frozen_string_literal: true

module Slack
  module BlockKit
    module Composition
      # An object containing some text, formatted using Slack's "mrkdwn".
      #
      # https://api.slack.com/reference/messaging/composition-objects#text
      # https://api.slack.com/messaging/composing/formatting
      class Mrkdwn
        TYPE = 'mrkdwn'

        def initialize(text:, verbatim: nil)
          @text = text
          @verbatim = verbatim
        end

        def as_json(*)
          {
            type: TYPE,
            text: @text,
            verbatim: @verbatim
          }.compact
        end
      end
    end
  end
end
