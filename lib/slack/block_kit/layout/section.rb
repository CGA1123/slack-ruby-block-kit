# frozen_string_literal: true

module Slack
  module BlockKit
    module Layout
      class Section
        TYPE = 'section'

        def initialize(text:, block_id: nil, fields: nil, accessory: nil)
          @text = text
          @block_id = block_id
          @fields = fields
          @accessory = accessory
        end

        def as_json(*)
          {
            type: TYPE,
            text: @text.as_json,
            block_id: block_id,
            fields: @fields&.map(&:as_json),
            accessory: @accessory&.as_json
          }.compact
        end
      end
    end
  end
end
