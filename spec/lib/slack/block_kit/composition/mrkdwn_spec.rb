# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Composition::Mrkdwn do
  describe '#as_json' do
    context 'when verbatim is not set' do
      it 'does not include it in the payload' do
        instance = described_class.new(text: 'some text')
        expected_hash = { type: 'mrkdwn', text: 'some text' }

        expect(instance.as_json).to eq(expected_hash)
      end
    end

    context 'when verbatim is set' do
      it 'includes it in the payload' do
        instance = described_class.new(text: 'some text', verbatim: true)
        expected_hash = { type: 'mrkdwn', text: 'some text', verbatim: true }

        expect(instance.as_json).to eq(expected_hash)
      end
    end
  end
end
