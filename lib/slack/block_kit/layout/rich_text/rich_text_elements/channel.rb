# frozen_string_literal: true

module Slack
  module BlockKit
    module Layout
      class RichText
        module RichTextElements
          # https://api.slack.com/reference/block-kit/blocks#element-types
          class Channel
            include RichTextElements::StyleHelper
            TYPE = 'channel'
            VALID_STYLES = %w[bold italic strike highlight client_highlight unlink].freeze

            def initialize(channel_id:, styles: [])
              @channel_id = channel_id
              @styles = styles
              validate_styles(styles, VALID_STYLES)
            end

            def as_json(*)
              {
                type: TYPE,
                channel_id: @channel_id,
                style: styles_as_json(@styles)
              }.compact
            end
          end
        end
      end
    end
  end
end
