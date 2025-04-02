# frozen_string_literal: true

require 'spec_helper'
require_relative '../limiters/block_id_helpers'

RSpec.describe Slack::BlockKit::Layout::Divider do
  let(:instance) { described_class.new(**params) }

  it_behaves_like 'a block that handles block_id length limits'

  describe '#as_json' do
    subject { instance.as_json }

    let(:params) { {} }
    let(:expected_json) { { type: 'divider' } }

    it { is_expected.to eq expected_json }

    context 'with block_id' do
      let(:params) { { block_id: '1123' } }
      let(:expected_json) do
        {
          type: 'divider',
          block_id: '1123'
        }
      end

      it { is_expected.to eq expected_json }
    end
  end
end
