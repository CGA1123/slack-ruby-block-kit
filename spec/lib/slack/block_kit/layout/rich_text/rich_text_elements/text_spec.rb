# frozen_string_literal: true

require 'spec_helper'
require_relative './style_helper'

RSpec.describe Slack::BlockKit::Layout::RichText::RichTextElements::Text do
  let(:text_json) { instance.as_json }
  let(:instance) { described_class.new(text: 'Some text') }

  describe '#as_json' do
    context 'when text is set' do
      it 'includes it in the payload' do
        expected_hash = { type: 'text', text: 'Some text' }

        expect(text_json).to eq(expected_hash)
      end
    end
  end

  it_behaves_like 'rich text valid style', described_class.new(text: 'Some text')
end
