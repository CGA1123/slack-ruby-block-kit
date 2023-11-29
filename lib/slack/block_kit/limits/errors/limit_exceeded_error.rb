# frozen_string_literal: true

module Slack
  module BlockKit
    module Limits
      module Errors
        class LimitExceededError < ::Slack::BlockKit::BlockKitError
        end
      end
    end
  end
end
