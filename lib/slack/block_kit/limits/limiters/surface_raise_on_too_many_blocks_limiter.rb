# frozen_string_literal: true

module Slack
  module BlockKit
    module Limits
      module Limiters
        class SurfaceRaiseOnTooManyBlocksLimiter < NoopLimiter
          attr_reader :surface_type, :max_blocks

          def initialize(surface_type:, max_blocks:)
            super()
            @surface_type = surface_type
            @max_blocks = max_blocks
          end

          def call(surface_json)
            return surface_json if surface_json[:blocks].nil?

            raise Errors::LimitExceededError, "Surfaces with type '#{surface_type}' allow a maximum of #{max_blocks} blocks. #{surface_json[:blocks].size} blocks have been specified." if surface_json[:blocks].size > max_blocks

            super(surface_json)
          end
        end
      end
    end
  end
end
