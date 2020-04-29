[![CircleCI](https://circleci.com/gh/CGA1123/slack-ruby-block-kit/tree/master.svg?style=svg)](https://circleci.com/gh/CGA1123/slack-ruby-block-kit/tree/master)
[![Gem Version](https://badge.fury.io/rb/slack-ruby-block-kit.svg)](https://badge.fury.io/rb/slack-ruby-block-kit)

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
gem 'slack-ruby-block-kit'
```


And then execute:

    $ bundle


Or install it yourself as:

    $ gem install slack-ruby-block-kit

Finally, require this:

```ruby
require 'slack-ruby-block-kit'
```

## Examples

Here are a few examples that might help you get started!

```ruby
require 'faraday'
require 'slack-ruby-block-kit'
require 'json'

a_prebuilt_block = Slack::BlockKit::Layout::Section.new
text = Slack::BlockKit::Composition::Mrkdwn.new(text: ':wave: *hello*')
an_image = Slack::BlockKit::Element::Image.new(image_url: 'https://git.io/fjDW8', alt_text: 'a picture')
a_prebuilt_block.accessorise(an_image)
a_prebuilt_block.text = text

blocks = Slack::BlockKit.blocks do |b|
  b.section do |s|
    s.plain_text(text: 'Some plain text message!')
    s.button(text: 'A button that is important', style: 'primary', action_id: 'id')
  end

  b.divider

  b.context do |c|
    c.mrkdwn(text: '_some italicised text for context_')
  end

  b.append(a_prebuilt_block)
end

webhook_url = 'https://hooks.slack.com/services/your/webhook/url'
body = { blocks: blocks.as_json, text: 'New block message!' }

response = Faraday.post(
  webhook_url,
  body.to_json,
  'Content-Type' => 'application/json'
)
```

This will create a message like this:

![example block message](https://git.io/fjDWR)

You can also check out the [`slackerduty`](https://github.com/CGA1123/slackerduty) project for some example,
[`Slackerduty::Alert`](https://github.com/CGA1123/slackerduty/blob/b33d708124ddf36d1432080ba7e16e66fefa6993/lib/slackerduty/alert.rb#L28-L34) and [`Slackerduty::Blocks`](https://github.com/CGA1123/slackerduty/blob/master/lib/slackerduty/blocks) may be helpful places to start.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/CGA1123/slack-ruby-block-kit

See [issues](https://github.com/CGA1123/slack-ruby-block-kit/issues) if you want any inspiration as to what to help with!

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
