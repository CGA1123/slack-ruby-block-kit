# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Composition::Option do
  describe '#as_json' do
    context 'when emoji is not set' do
      it 'does not include it in the payload' do
        instance = described_class.new(text: 'some text', value: 'a value')
        expected_hash = {
          value: 'a value',
          text: { type: 'plain_text', text: 'some text' }
        }

        expect(instance.as_json).to eq(expected_hash)
      end
    end

    context 'when emoji is set' do
      it 'includes it in the payload' do
        instance = described_class.new(
          text: 'some text',
          value: 'a value',
          emoji: true
        )

        expected_hash = {
          value: 'a value',
          text: { type: 'plain_text', text: 'some text', emoji: true }
        }

        expect(instance.as_json).to eq(expected_hash)
      end
    end

    context 'when description is set' do
      it 'includes description as a plain_text object in the payload' do
        instance = described_class.new(
          text: 'some text',
          value: 'a value',
          emoji: true,
          description: 'descriptive text'
        )

        expected_hash = {
          value: 'a value',
          text: { type: 'plain_text', text: 'some text', emoji: true },
          description: { type: 'plain_text', text: 'descriptive text', emoji: true }
        }

        expect(instance.as_json).to eq(expected_hash)
      end
    end

    context 'when url is set' do
      it 'includes url in the payload' do
        instance = described_class.new(
          text: 'some text',
          value: 'a value',
          emoji: true,
          url: 'https://example.com'
        )

        expected_hash = {
          value: 'a value',
          text: { type: 'plain_text', text: 'some text', emoji: true },
          url: 'https://example.com'
        }

        expect(instance.as_json).to eq(expected_hash)
      end
    end
  end
end
