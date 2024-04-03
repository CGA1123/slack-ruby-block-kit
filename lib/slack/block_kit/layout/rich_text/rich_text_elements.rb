# frozen_string_literal: true

module Slack
  module BlockKit
    module Layout
      class RichText
        module RichTextElements
          # https://api.slack.com/reference/block-kit/blocks#element-types
          def channel(channel_id:, styles: [])
            append(RichTextElements::Channel.new(channel_id: channel_id, styles: styles))
          end

          def emoji(name:)
            append(RichTextElements::Emoji.new(name: name))
          end

          def link(url:, text: nil, unsafe: nil, styles: [])
            append(RichTextElements::Link.new(url: url, text: text, unsafe: unsafe, styles: styles))
          end

          def text(text:, styles: [])
            append(RichTextElements::Text.new(text: text, styles: styles))
          end

          def user(user_id:, styles: [])
            append(RichTextElements::User.new(user_id: user_id, styles: styles))
          end

          def usergroup(usergroup_id:, styles: [])
            append(RichTextElements::Usergroup.new(usergroup_id: usergroup_id, styles: styles))
          end
        end
      end
    end
  end
end
