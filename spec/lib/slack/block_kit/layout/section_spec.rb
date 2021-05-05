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

  describe '#checkboxes' do
    let(:expected_accessory_json) do
      {
        action_id: '__ACTION_ID__',
        options: [
          {
            value: '__VALUE__',
            text: {
              type: 'plain_text',
              text: '__TEXT__'
            }
          }
        ],
        type: 'checkboxes'
      }
    end

    it 'correctly serializes' do
      instance.checkboxes(action_id: '__ACTION_ID__') do |checkboxes|
        checkboxes.option(value: '__VALUE__', text: '__TEXT__')
      end

      expect(section_json).to eq(expected_json.merge(accessory: expected_accessory_json))
    end
  end

  describe '#radio_buttons' do
    let(:expected_accessory_json) do
      {
        action_id: '__ACTION_ID__',
        options: [
          {
            value: '__VALUE__',
            text: {
              type: 'plain_text',
              text: '__TEXT__'
            }
          }
        ],
        type: 'radio_buttons'
      }
    end

    it 'correctly serializes' do
      instance.radio_buttons(action_id: '__ACTION_ID__') do |radio_buttons|
        radio_buttons.option(value: '__VALUE__', text: '__TEXT__')
      end

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

  context 'with fields and text' do
    describe '#plaintext_field' do
      let(:expected_plaintext_field_json) do
        {
          emoji: false,
          text: '__FIELD_TEXT__',
          type: 'plain_text'
        }
      end

      it 'correctly serializes' do
        instance.plaintext_field(text: '__FIELD_TEXT__', emoji: false)

        expect(section_json).to eq(expected_json.merge(fields: [expected_plaintext_field_json]))
      end
    end

    describe '#mrkdwn_field' do
      let(:expected_mrkdwn_field_json) do
        {
          verbatim: false,
          text: '__FIELD_MRKDWN__',
          type: 'mrkdwn'
        }
      end

      it 'correctly serializes' do
        instance.mrkdwn_field(text: '__FIELD_MRKDWN__', verbatim: false)

        expect(section_json).to eq(expected_json.merge(fields: [expected_mrkdwn_field_json]))
      end
    end
  end

  context 'with fields but no text' do
    let(:instance) { described_class.new(block_id: '__BLOCK__') }
    let(:expected_json) do
      {
        block_id: '__BLOCK__',
        type: 'section'
      }
    end

    describe 'single #mrkdwn_field' do
      let(:expected_mrkdwn_field_json) do
        {
          verbatim: false,
          text: '__FIELD_MRKDWN__',
          type: 'mrkdwn'
        }
      end

      it 'correctly serializes' do
        instance.mrkdwn_field(text: '__FIELD_MRKDWN__', verbatim: false)

        expect(section_json).to eq(expected_json.merge(fields: [expected_mrkdwn_field_json]))
      end
    end
  end
end
