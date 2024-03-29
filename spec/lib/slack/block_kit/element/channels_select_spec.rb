# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Element::ChannelsSelect do
  let(:instance) { described_class.new(**params) }
  let(:placeholder_text) { 'some text' }
  let(:action_id) { 'my-action' }
  let(:params) do
    {
      placeholder: placeholder_text,
      action_id: action_id
    }
  end

  describe '.initialize' do
    it 'yields self' do
      yielded = nil
      new_instance = described_class.new(**params) do |channel|
        yielded = channel
      end

      expect(new_instance).to be(yielded)
    end
  end

  describe '#as_json' do
    subject(:as_json) { instance.as_json }

    context 'with confirmation dialog' do
      subject(:as_json) do
        instance.confirmation_dialog do |confirm|
          confirm.title(text: '__CONFIRM_TITTLE__')
          confirm.plain_text(text: '__CONFIRM_TEXT__')
          confirm.confirm(text: '__CONFIRMED__')
          confirm.deny(text: '__DENIED__')
        end
        instance.as_json
      end

      let(:expected_json) do
        {
          type: 'channels_select',
          placeholder: {
            type: 'plain_text',
            text: placeholder_text
          },
          action_id: action_id,
          confirm: {
            confirm: {
              text: '__CONFIRMED__',
              type: 'plain_text'
            },
            deny: {
              text: '__DENIED__',
              type: 'plain_text'
            },
            text: {
              text: '__CONFIRM_TEXT__',
              type: 'plain_text'
            },
            title: {
              text: '__CONFIRM_TITTLE__',
              type: 'plain_text'
            }
          }
        }
      end

      it 'correctly serializes' do
        expect(as_json).to eq(expected_json)
      end
    end

    context 'with initial_channels' do
      let(:params) do
        {
          placeholder: placeholder_text,
          action_id: action_id,
          initial: 'channel-1'
        }
      end

      let(:expected_json) do
        {
          type: 'channels_select',
          placeholder: {
            type: 'plain_text',
            text: placeholder_text
          },
          action_id: action_id,
          initial_channel: 'channel-1'
        }
      end

      it 'correctly serializes' do
        expect(as_json).to eq(expected_json)
      end
    end

    context 'with focus_on_load' do
      let(:params) do
        {
          placeholder: placeholder_text,
          action_id: action_id,
          focus_on_load: true
        }
      end

      let(:expected_json) do
        {
          type: 'channels_select',
          placeholder: {
            type: 'plain_text',
            text: placeholder_text
          },
          action_id: action_id,
          focus_on_load: true
        }
      end

      it 'correctly serializes' do
        expect(as_json).to eq(expected_json)
      end
    end

    context 'with response_url_enabled' do
      let(:params) do
        {
          placeholder: placeholder_text,
          action_id: action_id,
          response_url_enabled: true
        }
      end

      let(:expected_json) do
        {
          type: 'channels_select',
          placeholder: {
            type: 'plain_text',
            text: placeholder_text
          },
          action_id: action_id,
          response_url_enabled: true
        }
      end

      it 'correctly serializes' do
        expect(as_json).to eq(expected_json)
      end
    end
  end
end
