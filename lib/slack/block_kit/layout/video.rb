# frozen_string_literal: true

module Slack
  module BlockKit
    module Layout
      # A video block is designed to embed videos in all app surfaces
      # (e.g. link unfurls, messages, modals, App Home)  — anywhere you can put blocks!
      # To use the video block within your app, you must have the links.embed:write scope.
      #
      # https://api.slack.com/reference/messaging/blocks#context
      class Video
        TYPE = 'video'

        def initialize(alt_text:, thumbnail_url:, video_url:, title:, description:, **optional_args)
          @alt_text = alt_text
          @thumbnail_url = thumbnail_url
          @video_url = video_url
          @author_name = optional_args[:author_name]
          @block_id = optional_args[:block_id]
          @provider_icon_url = optional_args[:provider_icon_url]
          @provider_name = optional_args[:provider_name]
          @title_url = optional_args[:title_url]
          @description = Composition::PlainText.new(
            text: description,
            emoji: optional_args[:emoji]
          )
          @title = Composition::PlainText.new(
            text: title,
            emoji: optional_args[:emoji]
          )
        end

        def as_json(*)
          {
            type: TYPE,
            alt_text: @alt_text,
            thumbnail_url: @thumbnail_url,
            video_url: @video_url,
            author_name: @author_name,
            block_id: @block_id,
            provider_icon_url: @provider_icon_url,
            provider_name: @provider_name,
            title_url: @title_url,
            description: @description.as_json,
            title: @title.as_json,
          }.compact
        end
      end
    end
  end
end
