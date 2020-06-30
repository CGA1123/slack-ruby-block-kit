# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Layout::Section do
  subject(:section_json) { instance.as_json }

  let(:instance) do
    block = described_class.new(block_id: '__BLOCK__')
    block.plain_text(text: '__BLOCK_TEXT__')
    block
  end
  let(:expected_json) do
    {
      block_id: '__BLOCK__',
      text: {
        text: '__BLOCK_TEXT__',
        type: 'plain_text'
      },
      type: 'section'
    }
  end

  it 'correctly serializes' do
    expect(section_json).to eq(expected_json)
  end

  describe '#multi_channels_select' do
    let(:expected_accessory_json) do
      {
        action_id: '__ACTION_ID__',
        placeholder: {
          text: '__PLACEHOLDER__',
          type: 'plain_text'
        },
        type: 'multi_channels_select'
      }
    end

    it 'correctly serializes' do
      instance.multi_channels_select(placeholder: '__PLACEHOLDER__', action_id: '__ACTION_ID__')

      expect(section_json).to eq(expected_json.merge(accessory: expected_accessory_json))
    end
  end

  describe '#multi_conversations_select' do
    let(:expected_accessory_json) do
      {
        action_id: '__ACTION_ID__',
        placeholder: {
          text: '__PLACEHOLDER__',
          type: 'plain_text'
        },
        type: 'multi_conversations_select'
      }
    end

    it 'correctly serializes' do
      instance.multi_conversations_select(placeholder: '__PLACEHOLDER__', action_id: '__ACTION_ID__')

      expect(section_json).to eq(expected_json.merge(accessory: expected_accessory_json))
    end
  end

  describe '#multi_external_select' do
    let(:expected_accessory_json) do
      {
        action_id: '__ACTION_ID__',
        placeholder: {
          text: '__PLACEHOLDER__',
          type: 'plain_text'
        },
        type: 'multi_external_select'
      }
    end

    it 'correctly serializes' do
      instance.multi_external_select(placeholder: '__PLACEHOLDER__', action_id: '__ACTION_ID__')

      expect(section_json).to eq(expected_json.merge(accessory: expected_accessory_json))
    end
  end

  describe '#multi_static_select' do
    let(:expected_accessory_json) do
      {
        action_id: '__ACTION_ID__',
        placeholder: {
          text: '__PLACEHOLDER__',
          type: 'plain_text'
        },
        type: 'multi_static_select'
      }
    end

    it 'correctly serializes' do
      instance.multi_static_select(placeholder: '__PLACEHOLDER__', action_id: '__ACTION_ID__')

      expect(section_json).to eq(expected_json.merge(accessory: expected_accessory_json))
    end
  end

  describe '#multi_users_select' do
    let(:expected_accessory_json) do
      {
        action_id: '__ACTION_ID__',
        placeholder: {
          text: '__PLACEHOLDER__',
          type: 'plain_text'
        },
        type: 'multi_users_select'
      }
    end

    it 'correctly serializes' do
      instance.multi_users_select(placeholder: '__PLACEHOLDER__', action_id: '__ACTION_ID__')

      expect(section_json).to eq(expected_json.merge(accessory: expected_accessory_json))
    end
  end

  describe '#image' do
    let(:expected_accessory_json) do
      {
        alt_text: '__ALT_TEXT__',
        image_url: '__URL__',
        type: 'image'
      }
    end

    it 'correctly serializes' do
      instance.image(url: '__URL__', alt_text: '__ALT_TEXT__')

      expect(section_json).to eq(expected_json.merge(accessory: expected_accessory_json))
    end
  end
end
