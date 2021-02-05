# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Element::MultiExternalSelect do
  let(:instance) { described_class.new(**params) }
  let(:placeholder_text) { 'some text' }
  let(:action_id) { 'my-action' }
  let(:params) do
    {
      placeholder: placeholder_text,
      action_id: action_id
    }
  end

  describe '#as_json' do
    subject(:as_json) { instance.as_json }

    context 'with confirmation dialog' do
      subject(:as_json) do
        instance.confirmation_dialog do |confirm|
          confirm.title(text: '__CONFIRM_TITTLE__')
          confirm.plain_text(text: '__CONFIRM_TEXT__')
          confirm.confirm(text: '__CONFIRMED__')
          confirm.deny(text: '__DENIED__')
        end
        instance.as_json
      end

      let(:expected_json) do
        {
          type: 'multi_external_select',
          placeholder: {
            type: 'plain_text',
            text: placeholder_text
          },
          action_id: action_id,
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

      it 'correctly serializes' do
        expect(as_json).to eq(expected_json)
      end
    end

    context 'with initial_options' do
      let(:initial_option) do
        Slack::BlockKit::Composition::Option.new(value: 'value-0', text: '*this is plain_text text*')
      end
      let(:params) do
        {
          placeholder: placeholder_text,
          action_id: action_id,
          initial: [initial_option]
        }
      end

      let(:expected_json) do
        {
          type: 'multi_external_select',
          placeholder: {
            type: 'plain_text',
            text: placeholder_text
          },
          action_id: action_id,
          initial_options: [
            {
              text: {
                type: 'plain_text',
                text: '*this is plain_text text*'
              },
              value: 'value-0'
            }
          ]
        }
      end

      it 'correctly serializes' do
        expect(as_json).to eq(expected_json)
      end
    end

    context 'with max_selected_items' do
      let(:params) do
        {
          placeholder: placeholder_text,
          action_id: action_id,
          max_selected_items: 10
        }
      end

      let(:expected_json) do
        {
          type: 'multi_external_select',
          placeholder: {
            type: 'plain_text',
            text: placeholder_text
          },
          action_id: action_id,
          max_selected_items: 10
        }
      end

      it 'correctly serializes' do
        expect(as_json).to eq(expected_json)
      end
    end

    context 'without max_selected_items' do
      let(:params) do
        {
          placeholder: placeholder_text,
          action_id: action_id
        }
      end

      let(:expected_json) do
        {
          type: 'multi_external_select',
          placeholder: {
            type: 'plain_text',
            text: placeholder_text
          },
          action_id: action_id
        }
      end

      it 'correctly serializes' do
        expect(as_json).to eq(expected_json)
      end
    end
  end
end
