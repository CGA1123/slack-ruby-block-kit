# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Layout::RichText::RichTextList do
  subject(:rich_text_list_json) { instance.as_json }

  let(:instance) { described_class.new(style: 'bullet') }
  let(:elements) { [] }
  let(:expected_json) do
    {
      elements: elements,
      style: 'bullet',
      type: 'rich_text_list'
    }
  end

  it 'correctly serializes' do
    expect(rich_text_list_json).to eq(expected_json)
  end

  describe '#rich_text_section' do
    let(:expected_json) do
      {
        elements: [{ elements: [], type: 'rich_text_section' }],
        style: 'bullet',
        type: 'rich_text_list'
      }
    end

    it 'correctly serializes' do
      instance.rich_text_section

      expect(rich_text_list_json).to eq(expected_json)
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
