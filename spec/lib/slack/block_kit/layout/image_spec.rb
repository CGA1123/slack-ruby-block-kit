# frozen_string_literal: true

require 'spec_helper'
require_relative '../limiters/block_id_helpers'

RSpec.describe Slack::BlockKit::Layout::Image do
  let(:instance) { described_class.new(**params) }

  it_behaves_like 'a block that handles block_id length limits', url: '__URL__', alt_text: '__ALT_TEXT__'

  describe '#as_json' do
    subject { instance.as_json }

    let(:params) do
      {
        url: '__URL__',
        alt_text: '__ALT_TEXT__'
      }
    end
    let(:expected_json) do
      {
        type: 'image',
        image_url: '__URL__',
        alt_text: '__ALT_TEXT__'
      }
    end

    it { is_expected.to eq expected_json }

    context 'with all arguments' do
      let(:params) do
        {
          url: '__URL__',
          alt_text: '__ALT_TEXT__',
          block_id: '1123',
          title: 'This is a title',
        }
      end
      let(:expected_json) do
        {
          type: 'image',
          image_url: '__URL__',
          alt_text: '__ALT_TEXT__',
          block_id: '1123',
          title: {
            type: 'plain_text',
            text: 'This is a title'
          }
        }
      end

      it { is_expected.to eq expected_json }
    end
  end
end
