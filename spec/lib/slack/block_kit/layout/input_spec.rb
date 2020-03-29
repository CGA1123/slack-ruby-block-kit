# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Layout::Input do
  let(:instance) { described_class.new(**params) }
  let(:optional) { false }
  let(:hint) { 'Your Name' }
  let(:label) { 'Name' }
  let(:block_id) { 'name' }
  let(:emoji) { false }
  let(:element) { Slack::BlockKit::Element::PlainTextInput.new(action_id: 'action') }
  let(:params) do
    {
      optional: optional,
      element: element,
      hint: hint,
      label: label,
      block_id: block_id,
      emoji: emoji
    }
  end

  describe '#as_json' do
    subject { instance.as_json }

    let(:expected_json) do
      {
        type: 'input',
        optional: optional,
        block_id: block_id,
        element: element.as_json,
        hint: Slack::BlockKit::Composition::PlainText.new(text: hint, emoji: emoji).as_json,
        label: Slack::BlockKit::Composition::PlainText.new(text: label, emoji: emoji).as_json
      }
    end

    it { is_expected.to eq(expected_json) }
  end
end
