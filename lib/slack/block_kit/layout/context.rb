# frozen_string_literal: true

module Slack
  module BlockKit
    module Layout
      class Context
        TYPE = 'context'

        def initialize(elements:, block_id: nil)
          @elements = elements
          @block_id = block_id
        end

        def as_json(*)
          {
            type: TYPE,
            elements: @elements.map(&:as_json),
            block_id: @block_id
          }.compact
        end
      end
    end
  end
end
