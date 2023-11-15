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

    context 'when label is very long' do
      it 'truncates the label' do
        option_with_long_label = described_class.new(
          text: 'a' * (::Slack::BlockKit::Limits::MAX_OPTION_TEXT_LENGTH + 1),
          value: 'a value',
          emoji: true
        )

        expect(option_with_long_label.as_json.dig(:text, :text)).to eq("#{'a' * (::Slack::BlockKit::Limits::MAX_OPTION_TEXT_LENGTH - '…'.length)}…")
      end
    end

    context 'when value is very long' do
      it 'raises an error' do
        options = described_class.new(
          text: 'some text',
          value: 'a' * (::Slack::BlockKit::Limits::MAX_OPTION_VALUE_LENGTH + 1),
          emoji: true
        )

        expect { options.as_json }.to raise_error(::Slack::BlockKit::Limits::Errors::LimitExceededError)
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

      it 'truncates long descriptions' do
        option_with_long_description = described_class.new(
          text: 'some text',
          value: 'a value',
          emoji: true,
          description: 'a' * (::Slack::BlockKit::Limits::MAX_OPTION_DESCRIPTION_LENGTH + 1)
        )

        expect(option_with_long_description.as_json.dig(:description, :text)).to eq("#{'a' * (::Slack::BlockKit::Limits::MAX_OPTION_DESCRIPTION_LENGTH - '…'.length)}…")
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
