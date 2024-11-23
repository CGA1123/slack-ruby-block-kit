# frozen_string_literal: true

module Slack
  module BlockKit
    module Limits
      module Limiters
        class NoopLimiter
          def call(json)
            json
          end
        end
      end
    end
  end
end
