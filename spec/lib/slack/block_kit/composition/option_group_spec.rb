# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Composition::OptionGroup do
  describe '#new' do
    it 'returns self' do
      expect(described_class.new(label: nil)).to be_a(described_class)
    end

    it 'yields self' do
      expect { |b| described_class.new(label: nil, &b) }
        .to yield_with_args(described_class)
    end

    it 'yields and returns the same instance' do
      yielded = nil
      returned = described_class.new(label: nil) { |blocks| yielded = blocks }

      expect(yielded).to be(returned)
    end
  end

  describe '#option' do
    it 'appends an option to options array' do
      instance = described_class.new(label: 'hello')

      expect { instance.option(text: 'option', value: 'o') }
        .to change { instance.options.count }.from(0).to(1)
    end

    it 'allows setting options as initial' do
      instance = described_class.new(label: 'hello')
      instance.option(text: 'option', value: 'o', initial: true)

      expect(instance.options.first).to be_initial
    end

    it 'supports option descriptions' do
      instance = described_class.new(label: 'hello')
      instance.option(text: 'option', value: 'o', description: 'description text')

      option_json = instance.options.first.as_json
      expect(option_json[:description]).to eq(
        { type: 'plain_text', text: 'description text' }
      )
    end

    it 'appends a Slack::BlockKit::Composition::Option object' do
      instance = described_class.new(label: 'hello')
      expected = Slack::BlockKit::Composition::Option.new(
        text: 'option',
        value: 'o',
        description: 'description'
      )

      instance.option(text: 'option', value: 'o', description: 'description')

      expect(instance.options.last.as_json).to eq(expected.as_json)
    end

    it 'returns self' do
      instance = described_class.new(label: 'hello')
      returned = instance.option(text: 't', value: 'v')

      expect(returned).to be(instance)
    end
  end

  describe '#as_json' do
    let(:expected) do
      {
        label: Slack::BlockKit::Composition::PlainText.new(text: 'label', emoji: true).as_json,
        options: [
          Slack::BlockKit::Composition::Option.new(
            text: 'text',
            value: 'value'
          ),
          Slack::BlockKit::Composition::Option.new(
            text: 'text with description',
            value: 'value2',
            description: 'some description'
          )
        ].map(&:as_json)
      }
    end

    it 'correctly serializes' do
      instance = described_class.new(label: 'label', emoji: true) do |option_group|
        option_group.option(text: 'text', value: 'value')
        option_group.option(
          text: 'text with description',
          value: 'value2',
          description: 'some description'
        )
      end

      expect(instance.as_json).to eq(expected)
    end
  end
end
