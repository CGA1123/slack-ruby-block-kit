#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/slack-ruby-block-kit'
require_relative './config'
require_relative './example_helper'
require 'json'

a_prebuilt_block = Slack::BlockKit::Layout::RichText.new
bold_rich_text_section = Slack::BlockKit::Layout::RichText::RichTextSection.new.text(text: 'Bold text', styles: ['bold'])
a_prebuilt_block.append(bold_rich_text_section)

italic_rich_text_section = Slack::BlockKit::Layout::RichText::RichTextSection.new.text(text: 'Italic text', styles: ['italic'])
a_prebuilt_block.append(italic_rich_text_section)

channel_rich_text = Slack::BlockKit::Layout::RichText::RichTextSection.new.channel(channel_id: Config.channel_id, styles: %w[bold italic])
a_prebuilt_block.append(channel_rich_text)

blocks = Slack::BlockKit.blocks do |b|
  b.append(a_prebuilt_block)
end

body = { blocks: blocks.as_json }
puts JSON.pretty_generate(body)

ExampleHelper.post_to_slack(body)
