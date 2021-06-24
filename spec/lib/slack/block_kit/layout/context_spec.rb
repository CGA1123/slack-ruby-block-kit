# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Layout::Context do
  subject(:context_json) { instance.as_json }

  let(:instance) { described_class.new(block_id: '__BLOCK__') }
  let(:elements) { [] }
  let(:expected_json) do
    {
      block_id: '__BLOCK__',
      elements: elements,
      type: 'context'
    }
  end

  it 'correctly serializes' do
    expect(context_json).to eq(expected_json)
  end

  describe '#image' do
    let(:expected_json) do
      {
        block_id: '__BLOCK__',
        elements: [{ alt_text: 'yes, you', image_url: 'https://git.io/JfvWK', type: 'image' }],
        type: 'context'
      }
    end

    it 'correctly serializes' do
      instance.image(url: 'https://git.io/JfvWK', alt_text: 'yes, you')

      expect(context_json).to eq(expected_json)
    end
  end

  describe '#plain_text' do
    let(:expected_json) do
      {
        block_id: '__BLOCK__',
        elements: [{ text: 'hello, world', type: 'plain_text' }],
        type: 'context'
      }
    end

    it 'correctly serializes' do
      instance.plain_text(text: 'hello, world')

      expect(context_json).to eq(expected_json)
    end
  end

  describe '#mrkdwn' do
    let(:expected_json) do
      {
        block_id: '__BLOCK__',
        elements: [{ text: 'hello, world', type: 'mrkdwn' }],
        type: 'context'
      }
    end

    it 'correctly serializes' do
      instance.mrkdwn(text: 'hello, world')

      expect(context_json).to eq(expected_json)
    end
  end

  describe '#append' do
    it 'returns self' do
      expect(instance.append(1)).to be(instance)
    end

    it 'appends to elements' do
      instance.append(1).append(2)

      expect(instance.elements).to eq([1, 2])
    end
  end
end
