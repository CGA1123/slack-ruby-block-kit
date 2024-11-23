# frozen_string_literal: true

module Slack
  module BlockKit
    module Limits
      # See https://api.slack.com/reference/block-kit/blocks for limits

      MAX_STATIC_SELECT_OPTIONS = 100

      MAX_OPTION_TEXT_LENGTH = 75
      MAX_OPTION_VALUE_LENGTH = 75
      MAX_OPTION_DESCRIPTION_LENGTH = 75

      MAX_NUMBER_OF_MODAL_BLOCKS = 100

      class << self
        attr_writer :default_limiter

        def set_limiter(class_name, limiter)
          registry[class_name] = limiter
        end

        def limiter_for(block_kit_instance)
          registry[block_kit_instance.class.name] || default_limiter
        end

        def default_limiter
          @default_limiter ||= Limiters::NoopLimiter.new
        end

        private

        def registry
          @registry ||= {}
        end
      end

      set_limiter 'Slack::BlockKit::Element::StaticSelect', Limiters::StaticSelectOptionsConfigRaiseOnErrorLimiter.new
      set_limiter 'Slack::BlockKit::Composition::Option', Limiters::OptionTruncateLabelAndDescriptionLimiter.new
      set_limiter 'Slack::Surfaces::Modal', Limiters::SurfaceRaiseOnTooManyBlocksLimiter.new(surface_type: :modal, max_blocks: MAX_NUMBER_OF_MODAL_BLOCKS)
    end
  end
end
