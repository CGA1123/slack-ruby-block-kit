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

        def to_h
          {
            type: TYPE,
            text: @text.to_h,
            block_id: block_id,
            fields: @fields&.map(&:to_h),
            accessory: @accessory&.to_h
          }.compact
        end
      end
    end
  end
end
