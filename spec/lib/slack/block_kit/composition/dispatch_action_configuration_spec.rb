# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Composition::DispatchActionConfiguration do
  describe '#trigger_on_enter_pressed' do
    it 'includes the correct trigger' do
      instance = described_class.new
      instance.trigger_on_enter_pressed
      expected_hash = { trigger_actions_on: [:on_enter_pressed] }

      expect(instance.as_json).to eq(expected_hash)
    end
  end

  describe '#trigger_on_character_entered' do
    it 'includes the correct trigger' do
      instance = described_class.new
      instance.trigger_on_character_entered
      expected_hash = { trigger_actions_on: [:on_character_entered] }

      expect(instance.as_json).to eq(expected_hash)
    end
  end

  describe '#as_json' do
    context 'when triggers are passed into the constructor' do
      it 'includes the correct triggers' do
        instance = described_class.new(triggers: [:on_enter_pressed])
        expected_hash = { trigger_actions_on: [:on_enter_pressed] }

        expect(instance.as_json).to eq(expected_hash)
      end
    end

    context 'when added using the methods' do
      it 'includes to correct triggers' do
        instance = described_class.new
        instance.trigger_on_enter_pressed
        instance.trigger_on_character_entered
        expected_hash = { trigger_actions_on: [:on_enter_pressed, :on_character_entered] }

        expect(instance.as_json).to eq(expected_hash)
      end
    end
  end
end
