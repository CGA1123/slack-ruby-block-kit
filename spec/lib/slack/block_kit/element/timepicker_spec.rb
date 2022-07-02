# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Element::Timepicker do
  describe '.initialize' do
    it 'yields self' do
      yielded = nil
      new_instance = described_class.new(action_id: '1123') do |timepicker|
        yielded = timepicker
      end

      expect(new_instance).to be(yielded)
    end
  end

  describe '#as_json' do
    context 'when minimal use case' do
      it 'encodes type and action_id' do
        instance = described_class.new(action_id: '1123')

        expect(instance.as_json).to eq(
          type: 'timepicker',
          action_id: '1123'
        )
      end
    end

    context 'with a placeholder' do
      let(:expected_json) do
        {
          type: 'timepicker',
          action_id: '1123',
          placeholder: Slack::BlockKit::Composition::PlainText.new(text: 'pick a time').as_json
        }
      end

      it 'encodes the placeholder object' do
        instance = described_class.new(
          action_id: '1123',
          placeholder: 'pick a time'
        )

        expect(instance.as_json).to eq(expected_json)
      end
    end

    context 'with initial_time' do
      let(:expected_json) do
        {
          type: 'timepicker',
          action_id: '1123',
          initial_time: '11:23'
        }
      end

      it 'encodes the initial_time' do
        instance = described_class.new(
          action_id: '1123',
          initial: '11:23'
        )

        expect(instance.as_json).to eq(expected_json)
      end
    end

    context 'with placeholder and initial_time' do
      let(:expected_json) do
        {
          type: 'timepicker',
          action_id: '1123',
          initial_time: '11:23',
          placeholder: Slack::BlockKit::Composition::PlainText.new(text: 'pick a time').as_json
        }
      end

      it 'encodes the placeholder & initial_time' do
        instance = described_class.new(
          action_id: '1123',
          initial: '11:23',
          placeholder: 'pick a time'
        )

        expect(instance.as_json).to eq(expected_json)
      end
    end
  end
end
