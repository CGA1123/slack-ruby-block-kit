# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Element::ExternalSelect do
  let(:instance) { described_class.new(**params) }
  let(:placeholder_text) { 'some text' }
  let(:action_id) { 'my-action' }
  let(:params) do
    {
      placeholder: placeholder_text,
      action_id: action_id
    }
  end

  describe '#as_json' do
    subject(:as_json) { instance.as_json }

    let(:expected_json) do
      {
        type: 'external_select',
        placeholder: {
          type: 'plain_text',
          text: placeholder_text
        },
        action_id: action_id
      }
    end

    it 'correctly serializes' do
      expect(as_json).to eq(expected_json)
    end
  end
end
