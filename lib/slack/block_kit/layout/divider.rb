# frozen_string_literal: true

module Slack
  module BlockKit
    module Layout
      class Divider
        TYPE = 'divider'

        def initialize(block_id: nil)
          @block_id = block_id
        end

        def as_json(*)
          {
            type: TYPE,
            block_id: @block_id
          }.compact
        end
      end
    end
  end
end
