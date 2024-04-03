# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Layout::RichText::RichTextPreformatted do
  subject(:rich_text_preformatted_json) { instance.as_json }

  let(:instance) { described_class.new }
  let(:elements) { [] }
  let(:expected_json) do
    {
      elements: elements,
      type: 'rich_text_preformatted'
    }
  end

  it 'correctly serializes' do
    expect(rich_text_preformatted_json).to eq(expected_json)
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

  it_behaves_like 'rich text element: channel', described_class.new
  it_behaves_like 'rich text element: emoji', described_class.new
  it_behaves_like 'rich text element: link', described_class.new
  it_behaves_like 'rich text element: text', described_class.new
  it_behaves_like 'rich text element: user', described_class.new
  it_behaves_like 'rich text element: usergroup', described_class.new
end
