# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Blocks do
  let(:instance) { described_class.new }

  describe '#header' do
    subject(:header) do
      instance.header(
        text: 'text',
        block_id: '1123',
        emoji: false
      )
    end

    let(:expected_json) do
      [
        {
          type: 'header',
          text: { text: 'text', emoji: false, type: 'plain_text' },
          block_id: '1123'
        }
      ]
    end

    it 'returns self' do
      expect(header).to be(instance)
    end

    it 'serialises a header block' do
      header

      expect(instance.as_json).to eq expected_json
    end
  end

  describe '#divider' do
    subject(:divider) { instance.divider(block_id: '1123') }

    let(:expected_json) { [{ type: 'divider', block_id: '1123' }] }

    it 'returns self' do
      expect(divider).to be(instance)
    end

    it 'serialises a divider block' do
      divider

      expect(instance.as_json).to eq expected_json
    end
  end

  describe '#actions' do
    subject(:actions) { instance.actions(block_id: '1123') }

    let(:expected_json) { [{ type: 'actions', elements: [], block_id: '1123' }] }

    it 'returns self' do
      expect(actions).to be(instance)
    end

    it 'serialises a actions block' do
      actions

      expect(instance.as_json).to eq expected_json
    end
  end

  describe '#context' do
    subject(:_context) { instance.context(block_id: '1123') }

    let(:expected_json) { [{ type: 'context', elements: [], block_id: '1123' }] }

    it 'returns self' do
      expect(_context).to be(instance)
    end

    it 'serialises a context block' do
      _context

      expect(instance.as_json).to eq expected_json
    end
  end

  describe '#section' do
    subject(:section) do
      instance.section(block_id: '1123') do |s|
        s.plain_text(text: 'hello')
      end
    end

    let(:expected_json) do
      [
        { type: 'section',
          text: { text: 'hello', type: 'plain_text' },
          block_id: '1123' }
      ]
    end

    it 'returns self' do
      expect(section).to be(instance)
    end

    it 'serialises a section block' do
      section

      expect(instance.as_json).to eq expected_json
    end
  end

  describe '#input' do
    subject(:input) do
      instance.input(label: 'input', hint: 'hint', block_id: '1123') do |i|
        i.plain_text_input(action_id: 'action')
      end
    end

    let(:expected_json) do
      [
        { type: 'input',
          hint: { text: 'hint', type: 'plain_text' },
          label: { text: 'input', type: 'plain_text' },
          element: { action_id: 'action', type: 'plain_text_input' },
          block_id: '1123' }
      ]
    end

    it 'returns self' do
      expect(input).to be(instance)
    end

    it 'serialises a input block' do
      input

      expect(instance.as_json).to eq expected_json
    end
  end

  describe '#append' do
    subject(:append) { instance.append(thing) }

    let(:thing) do
      Class.new do
        def as_json(*)
          { foo: 'bar' }
        end
      end.new
    end

    let(:expected_json) { [thing.as_json] }

    it 'returns self' do
      expect(append).to be(instance)
    end

    it 'serialises a appends block' do
      append

      expect(instance.as_json).to eq expected_json
    end
  end

  describe '#image' do
    subject(:image) do
      instance.image(
        url: 'https://git.io/JfvWK',
        alt_text: 'easter_egg',
        block_id: '1123'
      )
    end

    let(:expected_json) do
      [
        {
          type: 'image',
          alt_text: 'easter_egg',
          image_url: 'https://git.io/JfvWK',
          block_id: '1123'
        }
      ]
    end

    it 'returns self' do
      expect(image).to be(instance)
    end

    it 'serialises a image block' do
      image

      expect(instance.as_json).to eq expected_json
    end
  end
end
