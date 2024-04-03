# frozen_string_literal: true

module Slack
  module BlockKit
    module Layout
      class RichText
        module RichTextElements
          # https://api.slack.com/reference/block-kit/blocks#element-types
          class Text
            include RichTextElements::StyleHelper
            TYPE = 'text'
            VALID_STYLES = %w[bold italic strike code].freeze

            def initialize(text:, styles: [])
              @text = text
              @styles = styles
              validate_styles(styles, VALID_STYLES)
            end

            def as_json(*)
              {
                type: TYPE,
                text: @text,
                style: styles_as_json(@styles)
              }.compact
            end
          end
        end
      end
    end
  end
end
