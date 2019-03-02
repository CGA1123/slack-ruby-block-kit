# frozen_string_literal: true

module Slack
  module BlockKit
    module Element
      class Image
        TYPE = 'image'

        def initialize(image_url:, alt_text:)
          @image_url = image_url
          @alt_text = alt_text
        end

        def to_h
          {
            type: TYPE,
            image_url: @image_url,
            alt_text: @alt_text
          }
        end
      end
    end
  end
end
