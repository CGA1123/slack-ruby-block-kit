# frozen_string_literal: true

require 'spec_helper'

RSpec.shared_examples 'rich text valid style' do |klass|
  describe '#validate_styles' do
    let(:valid_styles) { %w[bold italic strike] }

    context 'when provided valid styles' do
      let(:provided_styles) { %w[bold italic] }

      it 'does not raise an error' do
        expect { klass.validate_styles(provided_styles, valid_styles) }.not_to raise_error
      end
    end

    context 'when provided an invalid style' do
      let(:provided_styles) { ['invalid style'] }

      it 'raises an error' do
        expect { klass.validate_styles(provided_styles, valid_styles) }.to \
          raise_error(ArgumentError, /Invalid style/)
      end
    end
  end

  describe '#styles_as_json' do
    context 'when no styles are provided' do
      let(:provided_styles) { [] }

      it 'does not return a payload' do
        expect(klass.styles_as_json(provided_styles)).to be_nil
      end
    end

    context 'when a single style is provided' do
      let(:provided_styles) { ['bold'] }

      it 'returns a payload' do
        expected_hash = { 'bold' => true }
        expect(klass.styles_as_json(provided_styles)).to eq(expected_hash)
      end
    end

    context 'when multiple styles are provided' do
      let(:provided_styles) { %w[bold italic] }

      it 'returns a payload' do
        expected_hash = { 'bold' => true, 'italic' => true }
        expect(klass.styles_as_json(provided_styles)).to eq(expected_hash)
      end
    end
  end
end
