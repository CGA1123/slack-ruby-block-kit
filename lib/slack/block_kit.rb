# frozen_string_literal: true

module Slack
  module BlockKit
    module Composition; end

    module Element; end

    module Layout; end

    Dir[File.join(__dir__, 'block_kit', 'composition', '*.rb')].sort.each { |file| require file }
    Dir[File.join(__dir__, 'block_kit', 'element', '*.rb')].sort.each { |file| require file }
    Dir[File.join(__dir__, 'block_kit', 'layout', '*.rb')].sort.each { |file| require file }
    Dir[File.join(__dir__, 'block_kit', '*.rb')].sort.each { |file| require file }
    Dir[File.join(__dir__, 'surfaces', '*.rb')].sort.each { |file| require file }

    module_function

    def blocks
      blocks = Blocks.new

      yield(blocks) if block_given?

      blocks
    end

    def home(blocks: nil,
             private_metadata: nil, callback_id: nil, external_id: nil)
      home_surface = Slack::Surfaces::Home.new(blocks: blocks,
                                               private_metadata: private_metadata,
                                               callback_id: callback_id,
                                               external_id: external_id)

      yield(home_surface) if block_given?

      home_surface
    end

    def modal(title: nil,
              blocks: nil,
              private_metadata: nil, callback_id: nil, external_id: nil,
              clear_on_close: nil, notify_on_close: nil)
      modal_surface = Slack::Surfaces::Modal.new(title: title,
                                                 blocks: blocks,
                                                 private_metadata: private_metadata,
                                                 callback_id: callback_id,
                                                 external_id: external_id,
                                                 clear_on_close: clear_on_close,
                                                 notify_on_close: notify_on_close)

      yield(modal_surface) if block_given?

      modal_surface
    end

    def message(blocks: nil, channel: nil, thread_ts: nil, as_user: nil, text: nil)
      message_surface = Slack::Surfaces::Message.new(
        blocks: blocks,
        channel: channel,
        thread_ts: thread_ts,
        text: text,
        as_user: as_user
      )

      yield(message_surface) if block_given?

      message_surface
    end
  end
end
