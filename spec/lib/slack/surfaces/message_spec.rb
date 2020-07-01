# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::Surfaces::Message do
  let(:image_url) { 'https://s3-media3.fl.yelpcdn.com/bphoto/c7ed05m9lC2EmA3Aruue7A/o.jpg' }

  describe '#as_json' do
    context 'with blocks argument' do
      subject(:instance) { described_class.new(blocks: blocks) }

      let(:blocks) do
        Slack::BlockKit.blocks do |block|
          block.image(url: image_url, alt_text: '__ALT_TEXT__')
        end
      end
      let(:expected_json) do
        {
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
      subject(:instance) { described_class.new }

      let(:expected_json) do
        {
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
        described_class.new(channel: '__CHANNEL__',
                            text: '__TEXT__',
                            thread_ts: '__THREAD_TS__',
                            as_user: true)
      end

      let(:expected_json) do
        {
          blocks: [
            {
              alt_text: '__ALT_TEXT__',
              image_url: image_url,
              type: 'image'
            }
          ],
          text: '__TEXT__',
          channel: '__CHANNEL__',
          thread_ts: '__THREAD_TS__',
          as_user: true
        }
      end

      it 'correctly serializes' do
        instance.blocks.image(url: image_url, alt_text: '__ALT_TEXT__')

        expect(instance.as_json).to eq(expected_json)
      end
    end
  end
end
