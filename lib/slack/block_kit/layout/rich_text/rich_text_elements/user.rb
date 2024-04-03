# frozen_string_literal: true

module Slack
  module BlockKit
    module Layout
      class RichText
        module RichTextElements
          # https://api.slack.com/reference/block-kit/blocks#element-types
          class User
            include RichTextElements::StyleHelper
            TYPE = 'user'
            VALID_STYLES = %w[bold italic strike highlight client_highlight unlink].freeze

            def initialize(user_id:, styles: [])
              @user_id = user_id
              @styles = styles
              validate_styles(styles, VALID_STYLES)
            end

            def as_json(*)
              {
                type: TYPE,
                user_id: @user_id,
                style: styles_as_json(@styles)
              }.compact
            end
          end
        end
      end
    end
  end
end
