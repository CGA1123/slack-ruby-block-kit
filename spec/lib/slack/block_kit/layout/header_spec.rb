# frozen_string_literal: true

require 'spec_helper'
require_relative '../limiters/block_id_helpers'

RSpec.describe Slack::BlockKit::Layout::Header do
  let(:instance) { described_class.new(**params) }

  it_behaves_like 'a block that handles block_id length limits', text: '__TEXT__'

  describe '#as_json' do
    subject { instance.as_json }

    context 'with plaintext only' do
      let(:params) { { text: 'This is a header' } }
      let(:expected_json) do
        {
          type: 'header',
          text: {
            type: 'plain_text',
            text: 'This is a header'
          }
        }
      end

      it { is_expected.to eq expected_json }
    end

    context 'with emoji' do
      let(:params) { { text: 'This is a header', emoji: true } }
      let(:expected_json) do
        {
          type: 'header',
          text: {
            type: 'plain_text',
            emoji: true,
            text: 'This is a header'
          }
        }
      end

      it { is_expected.to eq expected_json }
    end

    context 'with block_id' do
      let(:params) { { text: 'This is a header', block_id: '1123' } }
      let(:expected_json) do
        {
          type: 'header',
          block_id: '1123',
          text: {
            type: 'plain_text',
            text: 'This is a header'
          }
        }
      end

      it { is_expected.to eq expected_json }
    end
  end
end
