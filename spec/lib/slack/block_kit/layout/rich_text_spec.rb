# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Layout::RichText do
  subject(:rich_text_json) { instance.as_json }

  let(:instance) { described_class.new(block_id: '__BLOCK__') }
  let(:elements) { [] }
  let(:expected_json) do
    {
      block_id: '__BLOCK__',
      elements: elements,
      type: 'rich_text'
    }
  end

  it 'correctly serializes' do
    expect(rich_text_json).to eq(expected_json)
  end

  describe '#rich_text_section' do
    let(:expected_json) do
      {
        block_id: '__BLOCK__',
        elements: [{ elements: [], type: 'rich_text_section' }],
        type: 'rich_text'
      }
    end

    it 'correctly serializes' do
      instance.rich_text_section

      expect(rich_text_json).to eq(expected_json)
    end
  end

  describe '#rich_text_list' do
    let(:expected_json) do
      {
        block_id: '__BLOCK__',
        elements: [{ elements: [], style: 'bullet', type: 'rich_text_list' }],
        type: 'rich_text'
      }
    end

    it 'correctly serializes' do
      instance.rich_text_list

      expect(rich_text_json).to eq(expected_json)
    end
  end

  describe '#rich_text_preformatted' do
    let(:expected_json) do
      {
        block_id: '__BLOCK__',
        elements: [{ elements: [], type: 'rich_text_preformatted' }],
        type: 'rich_text'
      }
    end

    it 'correctly serializes' do
      instance.rich_text_preformatted

      expect(rich_text_json).to eq(expected_json)
    end
  end

  describe '#rich_text_quote' do
    let(:expected_json) do
      {
        block_id: '__BLOCK__',
        elements: [{ elements: [], type: 'rich_text_quote' }],
        type: 'rich_text'
      }
    end

    it 'correctly serializes' do
      instance.rich_text_quote

      expect(rich_text_json).to eq(expected_json)
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
