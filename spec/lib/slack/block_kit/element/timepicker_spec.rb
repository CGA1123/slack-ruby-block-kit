# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Element::Timepicker do
  let(:instance) { described_class.new(action_id: action_id) }
  let(:type) { 'timepicker' }
  let(:placeholder) { 'some text' }
  let(:initial_time) { '11:23' }
  let(:action_id) { '1123' }
  let(:placeholder_json) do
    Slack::BlockKit::Composition::PlainText.new(
      text: placeholder
    ).as_json
  end

  describe '.initialize' do
    it 'yields self' do
      yielded = nil
      new_instance = described_class.new(action_id: action_id) do |timepicker|
        yielded = timepicker
      end

      expect(new_instance).to be(yielded)
    end
  end

  describe '#placeholder' do
    it 'returns self' do
      expect(instance.placeholder(text: placeholder)).to be(instance)
    end
  end

  describe '#initial_time' do
    it 'returns self' do
      expect(instance.initial_time(initial_time)).to be(instance)
    end
  end

  describe '#as_json' do
    context 'when minimal use case' do
      it 'encodes type and action_id' do
        expect(instance.as_json).to eq(
          type: type,
          action_id: action_id
        )
      end
    end

    context 'with a placeholder' do
      let(:expected_json) do
        {
          type: type,
          action_id: action_id,
          placeholder: placeholder_json
        }
      end

      it 'encodes the placeholder object' do
        instance.placeholder(text: placeholder)

        expect(instance.as_json).to eq(expected_json)
      end
    end

    context 'with initial_time' do
      let(:expected_json) do
        {
          type: type,
          action_id: action_id,
          initial_time: initial_time
        }
      end

      it 'encodes the initial_time' do
        instance.initial_time(initial_time)

        expect(instance.as_json).to eq(expected_json)
      end
    end

    context 'with placeholder and initial_time' do
      let(:expected_json) do
        {
          type: type,
          action_id: action_id,
          initial_time: initial_time,
          placeholder: placeholder_json
        }
      end

      it 'encodes the placeholder & initial_time' do
        instance.placeholder(text: placeholder)
        instance.initial_time(initial_time)

        expect(instance.as_json).to eq(expected_json)
      end
    end
  end
end
