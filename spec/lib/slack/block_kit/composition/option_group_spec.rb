# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Composition::OptionGroup do
  describe '#new' do
    it 'returns self' do
      expect(described_class.new(label: nil)).to be_a(described_class)
    end

    it 'yields self' do
      expect { |b| described_class.new(label: nil, &b) }
        .to yield_with_args(described_class)
    end

    it 'yields and returns the same instance' do
      yielded = nil
      returned = described_class.new(label: nil) { |blocks| yielded = blocks }

      expect(yielded).to be(returned)
    end
  end

  describe '#option' do
    pending
  end

  describe '#as_json' do
    pending
  end
end
