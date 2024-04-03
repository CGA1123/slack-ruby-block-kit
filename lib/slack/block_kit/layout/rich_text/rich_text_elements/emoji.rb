# frozen_string_literal: true

module Slack
  module BlockKit
    module Layout
      class RichText
        module RichTextElements
          # https://api.slack.com/reference/block-kit/blocks#element-types
          class Emoji
            TYPE = 'emoji'

            def initialize(name:)
              @name = name
            end

            def as_json(*)
              {
                type: TYPE,
                name: @name
              }.compact
            end
          end
        end
      end
    end
  end
end
