# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Composition::PlainText do
  describe '#as_json' do
    context 'when emoji is not set' do
      it 'does not include it in the payload' do
        instance = described_class.new(text: 'some text')
        expected_hash = { type: 'plain_text', text: 'some text' }

        expect(instance.as_json).to eq(expected_hash)
      end
    end

    context 'when emoji is set' do
      it 'includes it in the payload' do
        instance = described_class.new(text: 'some text', emoji: true)
        expected_hash = { type: 'plain_text', text: 'some text', emoji: true }

        expect(instance.as_json).to eq(expected_hash)
      end
    end
  end
end
