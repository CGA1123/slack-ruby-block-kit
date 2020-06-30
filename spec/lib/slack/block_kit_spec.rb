# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit do
  describe '.blocks' do
    it 'returns an instance of Slack::BlockKit::Blocks' do
      expect(described_class.blocks).to be_a(Slack::BlockKit::Blocks)
    end

    it 'yields an instance of Slack::BlockKit::Blocks' do
      expect { |b| described_class.blocks(&b) }
        .to yield_with_args(Slack::BlockKit::Blocks)
    end

    it 'yields and returns the same instance of Slack::BlockKit::Blocks' do
      yielded = nil
      returned = described_class.blocks { |blocks| yielded = blocks }

      expect(yielded).to be(returned)
    end
  end

  describe '.message' do
    let(:expected_json) do
      {
        channel: '__CHANNEL_ID__',
        blocks: [
          {
            alt_text: '__ALT_TEXT__',
            image_url: 'https://image.com/image.png',
            type: 'image'
          }
        ]
      }
    end

    it 'correctly serializes' do
      msg = described_class.message(channel: '__CHANNEL_ID__')
      msg.blocks.image(url: 'https://image.com/image.png', alt_text: '__ALT_TEXT__')

      expect(msg.as_json).to eq(expected_json)
    end
  end

  describe '.home' do
    let(:expected_json) do
      {
        type: 'home',
        blocks: [
          {
            alt_text: '__ALT_TEXT__',
            image_url: 'https://image.com/image.png',
            type: 'image'
          }
        ]
      }
    end

    it 'correctly serializes' do
      home = described_class.home
      home.blocks.image(url: 'https://image.com/image.png', alt_text: '__ALT_TEXT__')

      expect(home.as_json).to eq(expected_json)
    end

    context 'all options' do
      let(:expected_json) do
        {
          type: 'home',
          blocks: [
            {
              alt_text: '__ALT_TEXT__',
              image_url: 'https://image.com/image.png',
              type: 'image'
            }
          ],
          private_metadata: '__META_DATA__',
          callback_id: '__CALLBACK_ID__',
          external_id: '__EXTERNAL_ID__'
        }
      end

      it 'correctly serializes' do
        home = described_class.home(private_metadata: '__META_DATA__',
                                    callback_id: '__CALLBACK_ID__',
                                    external_id: '__EXTERNAL_ID__')
        home.blocks.image(url: 'https://image.com/image.png', alt_text: '__ALT_TEXT__')

        expect(home.as_json).to eq(expected_json)
      end
    end
  end

  describe '.modal' do
    let(:expected_json) do
      {
        type: 'modal',
        blocks: [
          {
            alt_text: '__ALT_TEXT__',
            image_url: 'https://image.com/image.png',
            type: 'image'
          }
        ]
      }
    end

    it 'correctly serializes' do
      modal = described_class.modal
      modal.blocks.image(url: 'https://image.com/image.png', alt_text: '__ALT_TEXT__')

      expect(modal.as_json).to eq(expected_json)
    end

    context 'all options' do
      let(:expected_json) do
        {
          type: 'modal',
          blocks: [
            {
              alt_text: '__ALT_TEXT__',
              image_url: 'https://image.com/image.png',
              type: 'image'
            }
          ],
          private_metadata: '__META_DATA__',
          callback_id: '__CALLBACK_ID__',
          external_id: '__EXTERNAL_ID__',
          clear_on_close: true,
          notify_on_close: true
        }
      end

      it 'correctly serializes' do
        modal = described_class.modal(private_metadata: '__META_DATA__',
                                     callback_id: '__CALLBACK_ID__',
                                     external_id: '__EXTERNAL_ID__',
                                     clear_on_close: true,
                                     notify_on_close: true)
        modal.blocks.image(url: 'https://image.com/image.png', alt_text: '__ALT_TEXT__')

        expect(modal.as_json).to eq(expected_json)
      end
    end
  end
end
