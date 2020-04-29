# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Element::OverflowMenu do
  let(:instance) { described_class.new(**params) }
  let(:action_id) { 'my-action' }
  let(:params) { { action_id: action_id } }

  describe '#as_json' do
    subject { instance.as_json }

    let(:expected_json) do
      {
        type: 'overflow',
        action_id: action_id,
        options: [
          {
            'text': {
              'type': 'plain_text',
              'text': 'some text'
            },
            'value': 'value-0'
          },
          {
            'text': {
              'type': 'plain_text',
              'text': 'more text'
            },
            'value': 'value-1',
            'url': 'https://example.com'
          }
        ]
      }
    end

    it 'correctly serializes' do
      instance.option(value: 'value-0', text: 'some text')
      instance.option(value: 'value-1', text: 'more text', url: 'https://example.com')
      expect(subject).to eq(expected_json)
    end
  end
end
