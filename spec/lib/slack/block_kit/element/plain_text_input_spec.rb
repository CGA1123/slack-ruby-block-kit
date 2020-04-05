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
