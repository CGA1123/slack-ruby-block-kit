# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Layout::RichText::RichTextElements::Emoji do
  let(:instance) { described_class.new(name: 'wave') }
  let(:emoji_json) { instance.as_json }

  describe '#as_json' do
    context 'when name is set' do
      it 'includes it in the payload' do
        expected_hash = { type: 'emoji', name: 'wave' }

        expect(emoji_json).to eq(expected_hash)
      end
    end
  end
end
