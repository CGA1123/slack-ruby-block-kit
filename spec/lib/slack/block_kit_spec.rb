# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit do
  describe '.blocks' do
    it 'returns an instance of Slack::BlockKit::Blocks' do
      expect(described_class.blocks).to be_a(Slack::BlockKit::Blocks)
    end

    it 'yields an instance of Slack::BlockKit::Blocks' do
      expect { |b| described_class.blocks(&b) }
        .to yield_with_args(Slack::BlockKit::Blocks)
    end

    it 'yields and returns the same instance of Slack::BlockKit::Blocks' do
      yielded = nil
      returned = described_class.blocks { |blocks| yielded = blocks }

      expect(yielded).to be(returned)
    end
  end
end
