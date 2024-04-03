#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/slack-ruby-block-kit'
require_relative './config'
require_relative './example_helper'
require 'json'

# rubocop:disable Metrics/BlockLength
blocks = Slack::BlockKit.blocks do |b|
  b.rich_text do |rt|
    rt.rich_text_section do |rts|
      rts.text(text: "Bold text\n", styles: ['bold'])
      rts.text(text: "Italic text\n", styles: ['italic'])
      rts.text(text: "strikethrough text\n", styles: ['strike'])
      rts.text(text: "This is a code block!\n", styles: ['code'])
      rts.text(
        text: "This text has multiple styling\n",
        styles: %w[
          bold
          italic
          strike
        ]
      )
    end
  end

  b.divider

  b.rich_text do |rt|
    rt.rich_text_section do |rts|
      rts.text(text: 'Tagging a user:')
      rts.user(user_id: Config.user_id)
      rts.text(text: "\nTagging a user with some styling:")
      rts.user(user_id: Config.user_id, styles: %w[bold italic])
      rts.text(text: "\n")
    end
  end

  b.divider

  b.rich_text do |rt|
    rt.rich_text_section do |rts|
      rts.text(text: 'Tagging a user group:')
      rts.usergroup(usergroup_id: Config.usergroup_id)
      rts.text(text: "\nTagging a user group with some styling:")
      rts.usergroup(usergroup_id: Config.usergroup_id, styles: ['bold'])
      rts.text(text: "\n")
    end
  end

  b.divider

  b.rich_text do |rt|
    rt.rich_text_section do |rts|
      rts.text(text: 'Channel tag: ')
      rts.channel(channel_id: Config.channel_id)
      rts.text(text: "\n")
    end

    rt.rich_text_section do |rts|
      rts.text(text: 'Link to a great repo: ')
      rts.emoji(name: 'point_right')
      rts.link(url: 'https://github.com/CGA1123/slack-ruby-block-kit')
      rts.emoji(name: 'point_left')
      rts.text(text: "\n")
    end

    rt.rich_text_section do |rts|
      rts.emoji(name: 'muscle')
      rts.link(
        url: 'https://github.com/CGA1123/slack-ruby-block-kit',
        text: 'Link with alternative title',
        unsafe: true,
        styles: %w[
          bold
          italic
        ]
      )
      rts.emoji(name: 'muscle-two')
      rts.text(text: "\n")
    end
  end

  b.divider

  b.rich_text do |rt|
    rt.rich_text_list(style: 'bullet', indent: 1, offset: 1, border: 1) do |rtl|
      rtl.rich_text_section do |rts|
        rts.text(text: "Rich text\n", styles: %w[bold italic strike])
        rts.text(text: "strikethrough text\n", styles: ['strike'])
      end

      rtl.rich_text_section do |rts|
        rts.text(text: "strikethrough text\n", styles: ['strike'])
        rts.text(text: "code block text\n", styles: ['code'])
      end
    end

    rt.rich_text_list(style: 'ordered', indent: 2, offset: 2, border: 1) do |rtl|
      rtl.rich_text_section do |rts|
        rts.text(text: "Some text\n", styles: ['bold'])
        rts.text(text: "Some more text\n", styles: ['strike'])
      end
    end

    rt.rich_text_preformatted(border: 1) do |rtp|
      rtp.text(text: 'Some text', styles: %w[bold italic])
    end

    rt.rich_text_quote(border: 1) do |rtq|
      rtq.text(text: 'Some more text', styles: %w[bold strike])
    end
  end
end
# rubocop:enable Metrics/BlockLength

body = { blocks: blocks.as_json }
puts JSON.pretty_generate(body)

ExampleHelper.post_to_slack(body)
