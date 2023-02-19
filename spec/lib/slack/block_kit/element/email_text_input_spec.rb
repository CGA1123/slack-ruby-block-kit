# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Element::EmailTextInput do
  let(:instance) { described_class.new(**params) }
  let(:action_id) { 'my-action' }
  let(:placeholder) { 'example@email.com' }
  let(:initial_value) { 'jim@email.com' }
  let(:params) do
    {
      action_id: action_id,
      placeholder: placeholder,
      initial_value: initial_value,
      focus_on_load: true
    }
  end

  describe '#dispatch_action_config' do
    let(:expected_json) do
      {
        type: 'email_text_input',
        action_id: action_id,
        initial_value: initial_value,
        focus_on_load: true,
        placeholder: Slack::BlockKit::Composition::PlainText.new(text: placeholder).as_json,
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
        type: 'email_text_input',
        action_id: action_id,
        initial_value: initial_value,
        placeholder: Slack::BlockKit::Composition::PlainText.new(text: placeholder).as_json,
        focus_on_load: true
      }
    end

    it { is_expected.to eq(expected_json) }
  end
end
