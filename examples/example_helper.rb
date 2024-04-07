# frozen_string_literal: true

require 'faraday'

module ExampleHelper
  def self.print_output(line)
    $stderr.puts line unless ENV.fetch('SUPPRESS_WEBHOOK_MESSAGE', nil) == 'true'
  end

  def self.post_to_slack(body)
    if Config.webhook_url
      print_output 'Posting to Slack ...'
      Faraday.post(
        Config.webhook_url,
        body.to_json,
        'Content-Type' => 'application/json'
      )
    else
      print_output 'Set a "webhook_url" in "./config.rb" in order to test sending this message to Slack.'
    end
  end
end
