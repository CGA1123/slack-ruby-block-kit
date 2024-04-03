# frozen_string_literal: true

require 'spec_helper'
require_relative './style_helper'

RSpec.describe Slack::BlockKit::Layout::RichText::RichTextElements::Usergroup do
  let(:usergroup_json) { instance.as_json }
  let(:instance) { described_class.new(usergroup_id: 'AAAAAAAAA') }

  describe '#as_json' do
    context 'when usergroup_id is set' do
      it 'includes it in the payload' do
        expected_hash = { type: 'usergroup', usergroup_id: 'AAAAAAAAA' }

        expect(usergroup_json).to eq(expected_hash)
      end
    end
  end

  it_behaves_like 'rich text valid style', described_class.new(usergroup_id: 'AAAAAAAAA')
end
