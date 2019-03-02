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

        def to_h
          {
            title: @title.to_h,
            text: @text.to_h,
            confirm: @confirm.to_h,
            deny: @deny.to_h
          }
        end
      end
    end
  end
end
