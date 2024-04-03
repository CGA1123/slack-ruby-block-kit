# frozen_string_literal: true

module Slack
  module BlockKit
    module Layout
      class RichText
        module RichTextElements
          module StyleHelper
            def validate_styles(provided_styles, valid_styles)
              provided_styles.each do |style|
                raise ArgumentError, "Invalid style: #{style}. Valid styles: #{valid_styles}." unless valid_styles.include?(style)
              end
            end

            def styles_as_json(styles)
              return if styles.empty?

              styles.each_with_object({}) { |style, block| block[style] = true }
            end
          end
        end
      end
    end
  end
end
