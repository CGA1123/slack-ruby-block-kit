# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Layout::Actions do
  subject(:actions_json) { instance.as_json }

  let(:instance) do
    described_class.new(block_id: '__BLOCK__')
  end
  let(:expected_json) do
    {
      block_id: '__BLOCK__',
      elements: [],
      type: 'actions'
    }
  end

  it 'correctly serializes' do
    expect(actions_json).to eq(expected_json)
  end

  describe '#button' do
    let(:expected_element_json) do
      {
        action_id: '__ACTION_ID__',
        text: {
          text: '__PLACEHOLDER__',
          type: 'plain_text'
        },
        type: 'button'
      }
    end

    it 'correctly serializes' do
      instance.button(text: '__PLACEHOLDER__', action_id: '__ACTION_ID__')

      expected_json[:elements] << expected_element_json
      expect(actions_json).to eq(expected_json)
    end
  end

  describe '#channel_select' do
    let(:expected_element_json) do
      {
        action_id: '__ACTION_ID__',
        placeholder: {
          text: '__PLACEHOLDER__',
          type: 'plain_text'
        },
        type: 'channels_select'
      }
    end

    it 'correctly serializes' do
      instance.channel_select(placeholder: '__PLACEHOLDER__', action_id: '__ACTION_ID__')

      expected_json[:elements] << expected_element_json
      expect(actions_json).to eq(expected_json)
    end
  end

  describe '#conversation_select' do
    let(:expected_element_json) do
      {
        action_id: '__ACTION_ID__',
        placeholder: {
          text: '__PLACEHOLDER__',
          type: 'plain_text'
        },
        type: 'conversations_select'
      }
    end

    it 'correctly serializes' do
      instance.conversation_select(placeholder: '__PLACEHOLDER__', action_id: '__ACTION_ID__')

      expected_json[:elements] << expected_element_json
      expect(actions_json).to eq(expected_json)
    end
  end

  describe '#date_picker' do
    let(:expected_element_json) do
      {
        action_id: '__ACTION_ID__',
        placeholder: {
          text: '__PLACEHOLDER__',
          type: 'plain_text'
        },
        type: 'datepicker'
      }
    end

    it 'correctly serializes' do
      instance.date_picker(placeholder: '__PLACEHOLDER__', action_id: '__ACTION_ID__')

      expected_json[:elements] << expected_element_json
      expect(actions_json).to eq(expected_json)
    end
  end

  describe '#external_select' do
    let(:expected_element_json) do
      {
        action_id: '__ACTION_ID__',
        placeholder: {
          text: '__PLACEHOLDER__',
          type: 'plain_text'
        },
        type: 'external_select'
      }
    end

    it 'correctly serializes' do
      instance.external_select(placeholder: '__PLACEHOLDER__', action_id: '__ACTION_ID__')

      expected_json[:elements] << expected_element_json
      expect(actions_json).to eq(expected_json)
    end
  end

  describe '#overflow_menu' do
    let(:expected_element_json) do
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
        type: 'overflow'
      }
    end

    it 'correctly serializes' do
      instance.overflow_menu(action_id: '__ACTION_ID__') do |overflow_menu|
        overflow_menu.option(value: '__VALUE__', text: '__TEXT__')
      end

      expected_json[:elements] << expected_element_json
      expect(actions_json).to eq(expected_json)
    end
  end

  describe '#static_select' do
    let(:expected_element_json) do
      {
        action_id: '__ACTION_ID__',
        placeholder: {
          text: '__PLACEHOLDER__',
          type: 'plain_text'
        },
        options: [
          {
            value: '__VALUE__',
            text: {
              type: 'plain_text',
              text: '__TEXT__'
            }
          }
        ],
        type: 'static_select'
      }
    end

    it 'correctly serializes' do
      instance.static_select(placeholder: '__PLACEHOLDER__', action_id: '__ACTION_ID__') do |static_select|
        static_select.option(value: '__VALUE__', text: '__TEXT__')
      end

      expected_json[:elements] << expected_element_json
      expect(actions_json).to eq(expected_json)
    end
  end

  describe '#users_select' do
    let(:expected_element_json) do
      {
        action_id: '__ACTION_ID__',
        placeholder: {
          text: '__PLACEHOLDER__',
          type: 'plain_text'
        },
        type: 'users_select'
      }
    end

    it 'correctly serializes' do
      instance.users_select(placeholder: '__PLACEHOLDER__', action_id: '__ACTION_ID__')

      expected_json[:elements] << expected_element_json
      expect(actions_json).to eq(expected_json)
    end
  end

  describe '#checkboxes' do
    let(:expected_element_json) do
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

      expected_json[:elements] << expected_element_json
      expect(actions_json).to eq(expected_json)
    end
  end

  context 'with multiple actions' do
    describe '#button' do
      let(:expected_button_order) do
        [
          {
            action_id: '__BUTTON1__',
            text: {
              text: 'Button #1',
              type: 'plain_text'
            },
            type: 'button'
          },
          {
            action_id: '__BUTTON2__',
            text: {
              text: 'Button #2',
              type: 'plain_text'
            },
            type: 'button'
          }
        ]
      end

      it 'correctly serializes in order' do
        instance.button(text: 'Button #1', action_id: '__BUTTON1__')
        instance.button(text: 'Button #2', action_id: '__BUTTON2__')

        expected_json[:elements].concat(expected_button_order)
        expect(actions_json).to eq(expected_json)
      end
    end
  end
end
