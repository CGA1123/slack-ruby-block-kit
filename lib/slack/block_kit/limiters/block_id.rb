module Slack
  module BlockKit
    module Limiters
      module BlockId
        BLOCK_ID_LIMIT = 255

        def as_json
          json = super

          if Slack::BlockKit.config.autofix_invalid_blocks? && json[:block_id]
            json[:block_id] = Utils.truncate(json[:block_id].to_s, length: BLOCK_ID_LIMIT, omission: "")
          end

          json
        end
      end
    end
  end
end
