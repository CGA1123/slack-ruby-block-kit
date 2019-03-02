# frozen_string_literal: true

module Slack
  module BlockKit
    module Composition
      class Text
        def initialize(type:, text:, emoji: nil, verbatim: nil)
          @type = type
          @text = text
          @emoji = emoji
          @verbatim = verbatim
        end

        def to_h
          {
            type: @type,
            text: @text,
            emoji: @emoji,
            verbatim: @verbatim
          }.compact
        end
      end
    end
  end
end
