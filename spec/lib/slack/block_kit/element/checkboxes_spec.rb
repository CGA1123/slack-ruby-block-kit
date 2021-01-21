# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Element::Checkboxes do
  subject(:as_json) { instance.as_json }

  let(:instance) { described_class.new(**params) }
  let(:action_id) { 'my-action' }
  let(:params) { { action_id: action_id } }
  let(:option) { { value: 'option-1', text: 'Option 1' } }
  let(:option_description) { { value: 'option-2', text: 'Option 2', description: 'description' } }
  let(:another_option) { { value: 'option-3', text: 'Option 3' } }

  describe '#as_json' do
    let(:expected_json) do
      {
        type: 'checkboxes',
        action_id: action_id,
        options: [
          {
            text: {
              type: 'plain_text',
              text: 'Option 1'
            },
            value: 'option-1'
          },
          {
            text: {
              type: 'plain_text',
              text: 'Option 2'
            },
            description: {
              type: 'plain_text',
              text: 'description'
            },
            value: 'option-2'
          }
        ]
      }
    end

    it 'correctly serializes' do
      instance.option(**option)
      instance.option(**option_description)

      expect(as_json).to eq(expected_json)
    end

    context 'with initial options' do
      let(:expected_json) do
        {
          type: 'checkboxes',
          action_id: action_id,
          options: [
            {
              text: {
                type: 'plain_text',
                text: 'Option 1'
              },
              value: 'option-1'
            },
            {
              text: {
                type: 'plain_text',
                text: 'Option 2'
              },
              description: {
                type: 'plain_text',
                text: 'description'
              },
              value: 'option-2'
            },
            {
              text: {
                type: 'plain_text',
                text: 'Option 3'
              },
              value: 'option-3'
            }
          ],
          initial_options: [
            {
              text: {
                type: 'plain_text',
                text: 'Option 1'
              },
              value: 'option-1'
            },
            {
              text: {
                type: 'plain_text',
                text: 'Option 2'
              },
              description: {
                type: 'plain_text',
                text: 'description'
              },
              value: 'option-2'
            }
          ]
        }
      end

      it 'correctly serializes' do
        instance.option(**option.merge(initial: true))
        instance.option(**option_description.merge(initial: true))
        instance.option(**another_option)

        expect(as_json).to eq(expected_json)
      end
    end

    context 'with confirmation dialog' do
      let(:expected_json) do
        {
          type: 'checkboxes',
          action_id: action_id,
          options: [
            {
              text: {
                type: 'plain_text',
                text: 'Option 1'
              },
              value: 'option-1'
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
        instance.option(**option)
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
