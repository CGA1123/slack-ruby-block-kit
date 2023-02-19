# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Element::Datetimepicker do
  subject(:instance) { described_class.new(**params) }

  describe '.initialize' do
    it 'yields self' do
      yielded = nil
      new_instance = described_class.new(action_id: '1123') do |datetimepicker|
        yielded = datetimepicker
      end

      expect(new_instance).to be(yielded)
    end
  end

  describe '#as_json' do
    context 'when minimal use case' do
      let(:params) { { action_id: '1123' } }
      let(:expected_json) do
        {
          type: 'datetimepicker',
          action_id: '1123'
        }
      end

      it 'encodes type and action_id' do
        expect(instance.as_json).to eq(expected_json)
      end
    end

    context 'with initial' do
      let(:params) do
        {
          action_id: '1123',
          initial: 1_628_633_820
        }
      end

      let(:expected_json) do
        {
          type: 'datetimepicker',
          action_id: '1123',
          initial_date_time: 1_628_633_820
        }
      end

      it 'encodes the initial_date' do
        expect(instance.as_json).to eq(expected_json)
      end
    end

    context 'with focus_on_load' do
      let(:params) do
        {
          action_id: '1123',
          focus_on_load: true
        }
      end

      let(:expected_json) do
        {
          type: 'datetimepicker',
          action_id: '1123',
          focus_on_load: true
        }
      end

      it 'encodes focus_on_load' do
        expect(instance.as_json).to eq(expected_json)
      end
    end
  end
end
