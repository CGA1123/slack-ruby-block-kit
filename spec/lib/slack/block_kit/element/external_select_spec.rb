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

  describe '.initialize' do
    it 'yields self' do
      yielded = nil
      new_instance = described_class.new(**params) do |external_select|
        yielded = external_select
      end

      expect(new_instance).to be(yielded)
    end
  end

  describe '#as_json' do
    subject(:as_json) { instance.as_json }

    context 'when minimal use case' do
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
          type: 'external_select',
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
  end
end
