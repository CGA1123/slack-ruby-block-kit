# frozen_string_literal: true

module Slack
  module BlockKit
    module Layout
      class RichText
        module RichTextElements
          # https://api.slack.com/reference/block-kit/blocks#element-types
          class Link
            include RichTextElements::StyleHelper
            TYPE = 'link'
            VALID_STYLES = %w[bold italic strike code].freeze

            def initialize(url:, text: nil, unsafe: nil, styles: [])
              @url = url
              @text = text
              @unsafe = unsafe
              @styles = styles
              validate_styles(styles, VALID_STYLES)
            end

            def as_json(*)
              {
                type: TYPE,
                url: @url,
                text: @text,
                unsafe: @unsafe,
                style: styles_as_json(@styles)
              }.compact
            end
          end
        end
      end
    end
  end
end
