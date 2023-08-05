# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Element::NumberInput do
  let(:instance) { described_class.new(**params) }
  let(:action_id) { 'my-action' }
  let(:placeholder) { 'Pick a number' }
  let(:initial_value) { '1123' }
  let(:is_decimal_allowed) { true }
  let(:min_value) { '1' }
  let(:max_value) { '9999' }
  let(:params) do
    {
      action_id: action_id,
      is_decimal_allowed: is_decimal_allowed,
      placeholder: placeholder,
      initial_value: initial_value,
      focus_on_load: true,
      min_value: min_value,
      max_value: max_value
    }
  end

  describe '#dispatch_action_config' do
    let(:expected_json) do
      {
        type: 'number_input',
        is_decimal_allowed: is_decimal_allowed,
        action_id: action_id,
        initial_value: initial_value,
        focus_on_load: true,
        placeholder: Slack::BlockKit::Composition::PlainText.new(text: placeholder).as_json,
        min_value: min_value,
        max_value: max_value,
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
        type: 'number_input',
        action_id: action_id,
        initial_value: initial_value,
        placeholder: Slack::BlockKit::Composition::PlainText.new(text: placeholder).as_json,
        focus_on_load: true,
        is_decimal_allowed: is_decimal_allowed,
        min_value: min_value,
        max_value: max_value
      }
    end

    it { is_expected.to eq(expected_json) }
  end
end
