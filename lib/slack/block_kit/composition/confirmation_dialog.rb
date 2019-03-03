# frozen_string_literal: true

module Slack
  module BlockKit
    module Composition
      class ConfirmationDialog
        def initialize(title:, text:, confirm:, deny:)
          @title = title
          @text = text
          @confirm = confirm
          @deny = deny
        end

        def as_json(*)
          {
            title: @title.as_json,
            text: @text.as_json,
            confirm: @confirm.as_json,
            deny: @deny.as_json
          }
        end
      end
    end
  end
end
