# frozen_string_literal: true

require 'spec_helper'
require_relative './style_helper'

RSpec.describe Slack::BlockKit::Layout::RichText::RichTextElements::Link do
  let(:instance) { described_class.new(url: 'https://github.com', text: text, unsafe: unsafe) }
  let(:link_json) { instance.as_json }
  let(:text) { nil }
  let(:unsafe) { nil }

  describe '#as_json' do
    context 'when url is set' do
      it 'includes it in the payload' do
        expected_hash = { type: 'link', url: 'https://github.com' }

        expect(link_json).to eq(expected_hash)
      end
    end

    context 'when text is set' do
      let(:text) { 'alt text' }

      it 'includes it in the payload' do
        expected_hash = { type: 'link', url: 'https://github.com', text: 'alt text' }

        expect(link_json).to eq(expected_hash)
      end
    end

    context 'when unsafe is set' do
      let(:unsafe) { true }

      it 'includes it in the payload' do
        expected_hash = { type: 'link', url: 'https://github.com', unsafe: true }

        expect(link_json).to eq(expected_hash)
      end
    end
  end

  it_behaves_like 'rich text valid style', described_class.new(url: 'https://github.com')
end
