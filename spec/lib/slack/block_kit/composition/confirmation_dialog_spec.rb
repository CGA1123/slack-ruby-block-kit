# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Composition::ConfirmationDialog do
  let(:instance) { described_class.new }

  describe '#title' do
    it 'sets @title as PlainText'
    it 'returns self' do
      expect(instance.title(text: 'hello')).to be(instance)
    end
  end

  describe '#confirm' do
    it 'sets @confirm as PlainText'

    it 'returns self' do
      expect(instance.confirm(text: 'hello')).to be(instance)
    end
  end

  describe '#deny' do
    it 'sets @deny as PlainText'

    it 'returns self' do
      expect(instance.deny(text: 'hello')).to be(instance)
    end
  end

  describe '#style' do
    it 'sets @style as PlainText'

    it 'returns self' do
      expect(instance.style('danger')).to be(instance)
    end
  end

  describe '#plain_text' do
    it 'sets @text as PlainText'

    it 'returns self' do
      expect(instance.plain_text(text: 'hello')).to be(instance)
    end
  end

  describe '#mrkdwn' do
    it 'sets @text as Mrkdwn'

    it 'returns self' do
      expect(instance.mrkdwn(text: 'hello')).to be(instance)
    end
  end

  describe '#as_json' do
    context 'with plain_text' do
      let(:expected) do
        {
          title: Slack::BlockKit::Composition::PlainText.new(text: 'title').as_json,
          deny: Slack::BlockKit::Composition::PlainText.new(text: 'deny').as_json,
          confirm: Slack::BlockKit::Composition::PlainText.new(text: 'confirm').as_json,
          text: Slack::BlockKit::Composition::PlainText.new(text: 'plain_text').as_json
        }
      end

      it 'correctly serializes' do
        instance.title(text: 'title')
        instance.confirm(text: 'confirm')
        instance.deny(text: 'deny')
        instance.plain_text(text: 'plain_text')

        expect(instance.as_json).to eq(expected)
      end
    end

    context 'with mrkdwn' do
      let(:expected) do
        {
          title: Slack::BlockKit::Composition::PlainText.new(text: 'title').as_json,
          deny: Slack::BlockKit::Composition::PlainText.new(text: 'deny').as_json,
          confirm: Slack::BlockKit::Composition::PlainText.new(text: 'confirm').as_json,
          text: Slack::BlockKit::Composition::Mrkdwn.new(text: 'mrkdwn').as_json
        }
      end

      it 'correctly serializes' do
        instance.title(text: 'title')
        instance.confirm(text: 'confirm')
        instance.deny(text: 'deny')
        instance.mrkdwn(text: 'mrkdwn')

        expect(instance.as_json).to eq(expected)
      end
    end

    context 'when style is set' do
      let(:expected) do
        {
          title: Slack::BlockKit::Composition::PlainText.new(text: 'title').as_json,
          deny: Slack::BlockKit::Composition::PlainText.new(text: 'deny').as_json,
          confirm: Slack::BlockKit::Composition::PlainText.new(text: 'confirm').as_json,
          text: Slack::BlockKit::Composition::PlainText.new(text: 'plain_text').as_json,
          style: 'danger'
        }
      end

      it 'correctly serializes' do
        instance.title(text: 'title')
        instance.confirm(text: 'confirm')
        instance.deny(text: 'deny')
        instance.plain_text(text: 'plain_text')
        instance.style('danger')

        expect(instance.as_json).to eq(expected)
      end
    end
  end
end
