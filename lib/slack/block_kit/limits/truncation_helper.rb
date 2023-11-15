# frozen_string_literal: true

module Slack
  module BlockKit
    module Limits
      module TruncationHelper
        def truncate_string(str, truncate_at, omission: '…')
          return str.dup unless str.length > truncate_at

          "#{str[0, truncate_at - omission.length]}#{omission}"
        end
      end
    end
  end
end
