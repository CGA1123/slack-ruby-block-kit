# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Element::PlainTextInput do
  let(:instance) { described_class.new(**params) }
  let(:action_id) { 'my-action' }
  let(:placeholder) { 'John Doe' }
  let(:initial_value) { 'Jim Bob' }
  let(:multiline) { false }
  let(:min_length) { 5 }
  let(:max_length) { 120 }
  let(:emoji) { true }
  let(:params) do
    {
      action_id: action_id,
      placeholder: placeholder,
      emoji: emoji,
      initial_value: initial_value,
      multiline: multiline,
      min_length: min_length,
      max_length: max_length
    }
  end

  describe '#dispatch_action_config' do
    let(:expected_json) do
      {
        type: 'plain_text_input',
        action_id: action_id,
        initial_value: initial_value,
        min_length: min_length,
        max_length: max_length,
        multiline: multiline,
        placeholder: Slack::BlockKit::Composition::PlainText.new(text: placeholder, emoji: emoji).as_json,
        dispatch_action_config: Slack::BlockKit::Composition::DispatchActionConfiguration.new(
          triggers: [:on_enter_pressed]
        ).as_json
      }
    end

    context 'when passing in triggers directly' do
      it 'generates the correct output' do
        instance.dispatch_action_config(triggers: [:on_enter_pressed])

        expect(instance.as_json).to eq(expected_json)
      end
    end

    context 'when passing a block' do
      it 'generates the correct output' do
        instance.dispatch_action_config(&:trigger_on_enter_pressed)

        expect(instance.as_json).to eq(expected_json)
      end
    end
  end

  describe '#as_json' do
    subject { instance.as_json }

    let(:expected_json) do
      {
        type: 'plain_text_input',
        action_id: action_id,
        initial_value: initial_value,
        min_length: min_length,
        max_length: max_length,
        multiline: multiline,
        placeholder: Slack::BlockKit::Composition::PlainText.new(text: placeholder, emoji: emoji).as_json
      }
    end

    it { is_expected.to eq(expected_json) }
  end
end
