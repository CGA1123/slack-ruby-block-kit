# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Element::RadioButtons do
  let(:instance) { described_class.new(**params) }
  let(:action_id) { 'my-action' }
  let(:params) { { action_id: action_id } }

  describe '#as_json' do
    subject(:as_json) { instance.as_json }

    let(:expected_json) do
      {
        type: 'radio_buttons',
        action_id: action_id,
        options: [
          {
            value: 'option-1',
            text: {
              type: 'plain_text',
              text: 'Option 1'
            }
          },
          {
            value: 'option-2',
            text: {
              type: 'plain_text',
              text: 'Option 2'
            }
          }
        ],
        initial_option: {
          value: 'option-2',
          text: {
            type: 'plain_text',
            text: 'Option 2'
          }
        }
      }
    end

    it 'correctly serializes' do
      instance.option(value: 'option-1', text: 'Option 1')
      instance.option(value: 'option-2', text: 'Option 2', initial: true)
      expect(as_json).to eq(expected_json)
    end

    context 'with confirmation dialog' do
      let(:expected_json) do
        {
          type: 'radio_buttons',
          action_id: action_id,
          options: [
            {
              value: 'option-1',
              text: {
                type: 'plain_text',
                text: 'Option 1'
              }
            }
          ],
          confirm: {
            confirm: {
              text: '__CONFIRMED__',
              type: 'plain_text'
            },
            deny: {
              text: '__DENIED__',
              type: 'plain_text'
            },
            text: {
              text: '__CONFIRM_TEXT__',
              type: 'plain_text'
            },
            title: {
              text: '__CONFIRM_TITTLE__',
              type: 'plain_text'
            }
          }
        }
      end

      before do
        instance.option(value: 'option-1', text: 'Option 1')
        instance.confirmation_dialog do |confirm|
          confirm.title(text: '__CONFIRM_TITTLE__')
          confirm.plain_text(text: '__CONFIRM_TEXT__')
          confirm.confirm(text: '__CONFIRMED__')
          confirm.deny(text: '__DENIED__')
        end
      end

      it 'correctly serializes' do
        expect(as_json).to eq(expected_json)
      end
    end
  end
end
