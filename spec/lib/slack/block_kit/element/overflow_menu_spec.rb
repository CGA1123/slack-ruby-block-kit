# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Element::OverflowMenu do
  let(:action_id) { 'my-action' }
  let(:params) { { action_id: action_id } }
  let(:instance) do
    described_class.new(**params) do |menu|
      menu.option(value: 'value-0', text: 'some text')
      menu.option(value: 'value-1', text: 'more text', url: 'https://example.com')
      menu.confirmation_dialog do |confirmation|
        confirmation.title(text: 'Hello')
        confirmation.confirm(text: 'OK!')
        confirmation.deny(text: 'Nope.')
        confirmation.plain_text(text: 'Do you want to do the thing?')
      end
    end
  end

  describe '#as_json' do
    subject(:as_json) { instance.as_json }

    let(:expected_json) do
      {
        type: 'overflow',
        action_id: action_id,
        options: [
          {
            text: {
              type: 'plain_text',
              text: 'some text'
            },
            value: 'value-0'
          },
          {
            text: {
              type: 'plain_text',
              text: 'more text'
            },
            value: 'value-1',
            url: 'https://example.com'
          }
        ],
        confirm: {
          confirm: { text: 'OK!', type: 'plain_text' },
          deny: { text: 'Nope.', type: 'plain_text' },
          text: { text: 'Do you want to do the thing?', type: 'plain_text' },
          title: { text: 'Hello', type: 'plain_text' }
        }
      }
    end

    it 'correctly serializes' do
      expect(as_json).to eq(expected_json)
    end
  end
end
