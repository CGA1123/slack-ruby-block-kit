# frozen_string_literal: true

module Slack
  module BlockKit
    module Layout
      class RichText
        module RichTextElements
          # https://api.slack.com/reference/block-kit/blocks#element-types
          class Usergroup
            include RichTextElements::StyleHelper
            TYPE = 'usergroup'
            VALID_STYLES = %w[bold italic strike highlight client_highlight unlink].freeze

            def initialize(usergroup_id:, styles: [])
              @usergroup_id = usergroup_id
              @styles = styles
              validate_styles(styles, VALID_STYLES)
            end

            def as_json(*)
              {
                type: TYPE,
                usergroup_id: @usergroup_id,
                style: styles_as_json(@styles)
              }.compact
            end
          end
        end
      end
    end
  end
end
