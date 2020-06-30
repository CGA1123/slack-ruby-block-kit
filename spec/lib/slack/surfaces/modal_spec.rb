# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::Surfaces::Modal do
  let(:image_url) { 'https://s3-media3.fl.yelpcdn.com/bphoto/c7ed05m9lC2EmA3Aruue7A/o.jpg' }

  describe '#as_json' do
    context 'with blocks argument' do
      subject(:instance) { described_class.new(title: '__TITLE__', blocks: blocks) }

      let(:blocks) do
        Slack::BlockKit.blocks do |block|
          block.image(url: image_url, alt_text: '__ALT_TEXT__')
        end
      end
      let(:expected_json) do
        {
          type: 'modal',
          title: {
            text: '__TITLE__',
            type: 'plain_text'
          },
          blocks: [
            {
              alt_text: '__ALT_TEXT__',
              image_url: image_url,
              type: 'image'
            }
          ]
        }
      end

      it 'correctly serializes' do
        expect(instance.as_json).to eq(expected_json)
      end
    end

    context 'without blocks argument' do
      subject(:instance) { described_class.new(title: '__TITLE__') }

      let(:expected_json) do
        {
          type: 'modal',
          title: {
            text: '__TITLE__',
            type: 'plain_text'
          },
          blocks: [
            {
              alt_text: '__ALT_TEXT__',
              image_url: image_url,
              type: 'image'
            }
          ]
        }
      end

      it 'correctly serializes' do
        instance.blocks.image(url: image_url, alt_text: '__ALT_TEXT__')

        expect(instance.as_json).to eq(expected_json)
      end
    end

    context 'with other arguments' do
      subject(:instance) do
        described_class.new(title: '__TITLE__',
                            private_metadata: '__METADATA__',
                            callback_id: '__CALLBACK_ID__',
                            external_id: '__EXTERNAL_ID__',
                            clear_on_close: true,
                            notify_on_close: true)
      end

      let(:expected_json) do
        {
          type: 'modal',
          title: {
            text: '__TITLE__',
            type: 'plain_text'
          },
          blocks: [
            {
              alt_text: '__ALT_TEXT__',
              image_url: image_url,
              type: 'image'
            }
          ],
          private_metadata: '__METADATA__',
          callback_id: '__CALLBACK_ID__',
          external_id: '__EXTERNAL_ID__',
          clear_on_close: true,
          notify_on_close: true
        }
      end

      it 'correctly serializes' do
        instance.blocks.image(url: image_url, alt_text: '__ALT_TEXT__')

        expect(instance.as_json).to eq(expected_json)
      end
    end

    context 'with external title' do
      subject(:instance) { described_class.new(blocks: blocks) }

      let(:blocks) do
        Slack::BlockKit.blocks do |block|
          block.image(url: image_url, alt_text: '__ALT_TEXT__')
        end
      end
      let(:expected_json) do
        {
          type: 'modal',
          title: {
            text: '__TITLE__',
            type: 'plain_text',
            emoji: true
          },
          blocks: [
            {
              alt_text: '__ALT_TEXT__',
              image_url: image_url,
              type: 'image'
            }
          ]
        }
      end

      it 'correctly serializes' do
        instance.title(text: '__TITLE__', emoji: true)

        expect(instance.as_json).to eq(expected_json)
      end
    end

    context 'with close button' do
      subject(:instance) do
        described_class.new(title: '__TITLE__',
                            blocks: blocks)
      end

      let(:blocks) do
        Slack::BlockKit.blocks do |block|
          block.image(url: image_url, alt_text: '__ALT_TEXT__')
        end
      end
      let(:expected_json) do
        {
          type: 'modal',
          title: {
            text: '__TITLE__',
            type: 'plain_text'
          },
          close: {
            text: '__CLOSE__',
            type: 'plain_text'
          },
          blocks: [
            {
              alt_text: '__ALT_TEXT__',
              image_url: image_url,
              type: 'image'
            }
          ]
        }
      end

      it 'correctly serializes' do
        instance.close(text: '__CLOSE__')

        expect(instance.as_json).to eq(expected_json)
      end
    end

    context 'with submit button' do
      subject(:instance) do
        described_class.new(title: '__TITLE__',
                            blocks: blocks)
      end

      let(:blocks) do
        Slack::BlockKit.blocks do |block|
          block.image(url: image_url, alt_text: '__ALT_TEXT__')
        end
      end
      let(:expected_json) do
        {
          type: 'modal',
          title: {
            text: '__TITLE__',
            type: 'plain_text'
          },
          submit: {
            text: '__SUBMIT__',
            type: 'plain_text'
          },
          blocks: [
            {
              alt_text: '__ALT_TEXT__',
              image_url: image_url,
              type: 'image'
            }
          ]
        }
      end

      it 'correctly serializes' do
        instance.submit(text: '__SUBMIT__')

        expect(instance.as_json).to eq(expected_json)
      end
    end
  end
end
