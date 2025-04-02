# frozen_string_literal: true

require 'spec_helper'

RSpec.shared_examples_for 'a block that handles block_id length limits' do |**params|
  let(:block) { described_class.new(block_id: block_id, **params) }
  let(:block_id) { 'a' * (Slack::BlockKit::Limiters::BlockId::BLOCK_ID_LIMIT + 1) }

  subject(:json) { block.as_json }

  context 'when autofix is disabled' do
    it 'does not truncate the block_id when converting to JSON' do
      expect(json[:block_id]).to eq(block_id)
    end
  end

  context 'when autofix is enabled' do
    let(:block) { described_class.new(block_id: block_id, **params) }

    around do |example|
      Slack::BlockKit.configuration.autofix_invalid_blocks = true
      example.run
      Slack::BlockKit.configuration.autofix_invalid_blocks = false
    end

    it 'truncates the block_id when converting to JSON' do
      expect(json[:block_id]).to eq('a' * Slack::BlockKit::Limiters::BlockId::BLOCK_ID_LIMIT)
    end

    context 'when the block_id is already within the limit' do
      let(:block_id) { 'a' * (Slack::BlockKit::Limiters::BlockId::BLOCK_ID_LIMIT - 1) }

      it 'does not truncate the block_id' do
        expect(json[:block_id]).to eq(block_id)
      end
    end

    context 'when no block_id is provided' do
      let(:block) { described_class.new(**params) }
      let(:block_id) { nil }

      it 'does not include block_id in the JSON' do
        expect(json).not_to have_key(:block_id)
      end
    end
  end
end
