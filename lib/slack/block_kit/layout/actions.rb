# frozen_string_literal: true

module Slack
  module BlockKit
    module Layout
      class Actions
        TYPE = 'actions'

        def initialize(elements:, block_id: nil)
          @elements = elements
          @block_id = block_id
        end

        def to_h
          {
            type: TYPE,
            elements: @elements.map(&:to_h),
            block_id: @block_id
          }.compact
        end
      end
    end
  end
end
