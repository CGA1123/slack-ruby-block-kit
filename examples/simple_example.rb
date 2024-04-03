#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/slack-ruby-block-kit'
require_relative './config'
require_relative './example_helper'
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

body = { blocks: blocks.as_json }
puts JSON.pretty_generate(body)

ExampleHelper.post_to_slack(body)
