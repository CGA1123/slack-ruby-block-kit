# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Utils do
  describe '.truncate' do
    it 'truncates a string to the specified length' do
      expect(described_class.truncate('Hello, world!', length: 13)).to eq('Hello, world!')
      expect(described_class.truncate('Hello, world!', length: 12)).to eq('Hello, wo...')
    end

    it 'truncates a string with a custom omission' do
      expect(described_class.truncate('Hello, world!', length: 13, omission: '[...]')).to eq('Hello, world!')
      expect(described_class.truncate('Hello, world!', length: 12, omission: '[...]')).to eq('Hello, [...]')
    end

    it 'truncates a string based on a separator' do
      expect(described_class.truncate('Hello, world!', length: 13, separator: ' ')).to eq('Hello, world!')
      expect(described_class.truncate('Hello, world!', length: 13, separator: /\s/)).to eq('Hello, world!')

      expect(described_class.truncate('Hello, big world!', length: 13, separator: ' ')).to eq('Hello, big...')
      expect(described_class.truncate('Hello, big world!', length: 12, separator: /\s/)).to eq('Hello,...')
      expect(described_class.truncate('Hello, big world!', length: 13, separator: /,/)).to eq('Hello...')
    end

    it 'truncates a string with a custom omission and separator' do
      expect(described_class.truncate('Hello, big world!', length: 16, omission: '[...]', separator: ' ')).to eq('Hello, big[...]')
      expect(described_class.truncate('Hello, big world!', length: 14, omission: '[...]', separator: /\s/)).to eq('Hello,[...]')
      expect(described_class.truncate('Hello, big world!', length: 16, omission: '[...]', separator: /,/)).to eq('Hello[...]')
    end
  end
end
