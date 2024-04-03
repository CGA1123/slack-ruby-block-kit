# Examples

These example files demonstrate worked examples of how to use the gem.  
They are written in a way that you can:
- send the messages to your own Slack workspace, when a valid Slack `webhook_url` has been provided (see `./config.rb`)
- copy and paste the output to Slack's [Block Builder Kit](https://app.slack.com/block-kit-builder) to validate the output without having to send a message to Slack

> [!NOTE]
> There are some values that need to be valid otherwise Slack, or the Block Builder Kit UI, will return a warning reporting the block output is invalid

## How to use
1. Update `./config.rb`
1. Run `bundle exec examples/simple_example.rb`

> [!TIP]
> When using [Block Builder Kit](https://app.slack.com/block-kit-builder) to validate the output, set `SUPPRESS_WEBHOOK_MESSAGE=true` to suppress lines that would invalid the output, e.g.:
> `SUPPRESS_WEBHOOK_MESSAGE=true examples/simple_example.rb | pbcopy` # on Mac
> `SUPPRESS_WEBHOOK_MESSAGE=true examples/simple_example.rb | xclip -selection clipboard` # on Linux
