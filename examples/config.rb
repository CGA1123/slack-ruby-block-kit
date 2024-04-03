# frozen_string_literal: true

# When using Slack's Block Builder Kit, https://app.slack.com/block-kit-builder, there are some values that need
# to be valid otherwise the UI will return a warning and report the block as being invalid.

# Store and populate any other examples here, and use throughout 'examples/' scripts.

module Config
  class << self
    attr_accessor :channel_id, :user_id, :usergroup_id, :webhook_url
  end

  self.channel_id = 'CL9QH354H'
  self.user_id = 'URLQ55EMB'
  self.usergroup_id = 'SBR3Q0B2T'

  # Uncomment and provide a valid webook to post to `examples/` scripts to Slack:
  # self.webhook_url = 'https://hooks.slack.com/services/your/webhook/url'
end
