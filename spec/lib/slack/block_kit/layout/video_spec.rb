# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Layout::Video do
  describe '.as_json' do
    subject(:video_json) { instance.as_json }

    context 'when only required arguments are provided' do
      let(:instance) do
        described_class.new(
          alt_text: '__ALT_TEXT__',
          thumbnail_url: '__THUMBNAIL_URL__',
          video_url: '__VIDEO_URL__',
          title: '__TITLE__',
          description: '__DESCRIPTION__'
        )
      end

      it 'correctly serializes arguments' do
        expect(video_json).to eq({
                                   type: 'video',
                                   alt_text: '__ALT_TEXT__',
                                   thumbnail_url: '__THUMBNAIL_URL__',
                                   video_url: '__VIDEO_URL__',
                                   title: {
                                     type: 'plain_text',
                                     text: '__TITLE__'
                                   },
                                   description: {
                                     type: 'plain_text',
                                     text: '__DESCRIPTION__'
                                   }
                                 })
      end
    end

    context 'when all arguments are provided' do
      let(:instance) do
        described_class.new(
          alt_text: '__ALT_TEXT__',
          thumbnail_url: '__THUMBNAIL_URL__',
          video_url: '__VIDEO_URL__',
          title: '__TITLE__',
          description: '__DESCRIPTION__',
          author_name: '__AUTHOR_NAME__',
          block_id: '__BLOCK_ID__',
          provider_icon_url: '__PROVIDER_ICON_URL__',
          provider_name: '__PROVIDER_NAME__',
          title_url: '__TITLE_URL__',
          emoji: false
        )
      end

      it 'correctly serializes arguments' do
        expect(video_json).to eq({
                                   type: 'video',
                                   alt_text: '__ALT_TEXT__',
                                   thumbnail_url: '__THUMBNAIL_URL__',
                                   video_url: '__VIDEO_URL__',
                                   title: {
                                     type: 'plain_text',
                                     text: '__TITLE__',
                                     emoji: false
                                   },
                                   description: {
                                     type: 'plain_text',
                                     text: '__DESCRIPTION__',
                                     emoji: false
                                   },
                                   author_name: '__AUTHOR_NAME__',
                                   block_id: '__BLOCK_ID__',
                                   provider_icon_url: '__PROVIDER_ICON_URL__',
                                   provider_name: '__PROVIDER_NAME__',
                                   title_url: '__TITLE_URL__'
                                 })
      end
    end
  end
end
