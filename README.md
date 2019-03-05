[![CircleCI](https://circleci.com/gh/CGA1123/slack_block_kit-ruby/tree/master.svg?style=svg)](https://circleci.com/gh/CGA1123/slack_block_kit-ruby/tree/master)
[![Gem Version](https://badge.fury.io/rb/slack_block_kit.svg)](https://badge.fury.io/rb/slack_block_kit)

# Slack::BlockKit

A collection of ruby objects that represent Slack's block kit.

You can play around with the block kit using [Slack's block kit builder!](https://api.slack.com/tools/block-kit-builder)

The 'blocks' availables are split in line with how Slack documents them, that is:

- `Slack::BlockKit::Layout` contains the [Layout blocks](https://api.slack.com/reference/messaging/blocks)
- `Slack::BlockKit::Element` contains the [Block elements](https://api.slack.com/reference/messaging/block-elements)
- `Slack::BlockKit::Composition` contains the [Message composition objects](https://api.slack.com/reference/messaging/composition-objects)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'slack_block_kit'
```


And then execute:

    $ bundle


Or install it yourself as:

    $ gem install slack_block_kit

Finally, require this:

```ruby
require 'slack/block_kit'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/CGA1123/slack_block_kit-ruby

See [issues](https://github.com/CGA1123/slack_block_kit-ruby/issues) if you want any inspiration as to what to help with!

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
