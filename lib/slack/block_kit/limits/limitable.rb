# frozen_string_literal: true

module Slack
  module BlockKit
    module Limits
      module Limitable
        def as_json(*)
          original_json = super
          limiter.call(original_json)
        end

        private

        def limiter
          ::Slack::BlockKit::Limits.limiter_for(self)
        end
      end
    end
  end
end
