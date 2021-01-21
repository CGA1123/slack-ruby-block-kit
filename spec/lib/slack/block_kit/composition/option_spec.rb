# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Composition::Option do
  describe '#as_json' do
    context 'when emoji is not set' do
      it 'does not include it in the payload' do
        instance = described_class.new(text: 'some text', value: 'a value')
        expected = {
          value: 'a value',
          text: { type: 'plain_text', text: 'some text' }
        }

        expect(instance.as_json).to eq(expected)
      end
    end

    context 'when emoji is set' do
      let(:expected) do
        {
          value: 'a value',
          text: { type: 'plain_text', text: 'some text', emoji: true }
        }
      end

      it 'includes it in the payload' do
        instance = described_class.new(
          text: 'some text',
          value: 'a value',
          emoji: true
        )

        expect(instance.as_json).to eq(expected)
      end
    end

    context 'when description is set' do
      let(:expected) do
        {
          value: 'a value',
          text: { type: 'plain_text', text: 'some text', emoji: true },
          description: { type: 'plain_text', text: 'descriptive text', emoji: true }
        }
      end

      let(:instance) do
        described_class.new(
          text: 'some text',
          value: 'a value',
          emoji: true,
          description: 'descriptive text'
        )
      end

      it 'includes description as a plain_text object in the payload' do
        expect(instance.as_json).to eq(expected)
      end
    end

    context 'when url is set' do
      let(:expected) do
        {
          value: 'a value',
          text: { type: 'plain_text', text: 'some text', emoji: true },
          url: 'https://example.com'
        }
      end

      let(:instance) do
        described_class.new(
          text: 'some text',
          value: 'a value',
          emoji: true,
          url: 'https://example.com'
        )
      end

      it 'includes url in the payload' do
        expect(instance.as_json).to eq(expected)
      end
    end

    describe '#initial?' do
      subject(:initial?) { instance.initial? }

      context 'when default' do
        let(:instance) { described_class.new(text: 'some text', value: 'a value') }

        it { is_expected.to be false }
      end

      context 'when initial: true' do
        let(:instance) do
          described_class.new(
            text: 'some text',
            value: 'a value',
            initial: true
          )
        end

        it { is_expected.to be true }
      end
    end
  end
end
