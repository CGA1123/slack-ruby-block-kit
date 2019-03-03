# frozen_string_literal: true

module Slack
  module BlockKit
    module Layout
      class Image
        TYPE = 'image'

        def initialize(image_url:, alt_text:, title: nil, block_id: nil)
          @image_url = image_url
          @alt_text = alt_text
          @title = title
          @block_id = block_id
        end

        def as_json(*)
          {
            type: TYPE,
            image_url: @image_url,
            alt_text: @alt_text,
            title: @title&.as_json,
            block_id: @block_id
          }.compact
        end
      end
    end
  end
end
