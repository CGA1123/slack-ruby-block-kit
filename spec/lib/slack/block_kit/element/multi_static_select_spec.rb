# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Element::MultiStaticSelect do
  let(:instance) { described_class.new(**params) }
  let(:placeholder_text) { 'some text' }
  let(:action_id) { 'my-action' }
  let(:params) do
    {
      placeholder: placeholder_text,
      action_id: action_id
    }
  end

  let(:expected_option_groups) do
    [
      {
        label: {
          text: '__GROUP__',
          type: 'plain_text'
        },
        options: [
          {
            text: {
              text: '__TEXT_1__',
              type: 'plain_text'
            },
            value: '__VALUE_1__',
            description: {
              type: 'plain_text',
              text: '__DESCRIPTION_1__'
            }
          },
          {
            text: {
              text: '__TEXT_2__',
              type: 'plain_text'
            },
            value: '__VALUE_2__',
            description: {
              type: 'plain_text',
              text: '__DESCRIPTION_2__'
            }
          },
          {
            text: {
              text: '__TEXT_3__',
              type: 'plain_text'
            },
            value: '__VALUE_3__',
            description: {
              type: 'plain_text',
              text: '__DESCRIPTION_3__'
            }
          }
        ]
      }
    ]
  end

  let(:expected_initial_options) do
    [
      {
        text: {
          text: '__TEXT_2__',
          type: 'plain_text'
        },
        value: '__VALUE_2__',
        description: {
          type: 'plain_text',
          text: '__DESCRIPTION_2__'
        }
      }
    ]
  end

  let(:expected_options) do
    [
      {
        text: {
          text: '__TEXT_1__',
          type: 'plain_text'
        },
        value: '__VALUE_1__',
        description: {
          type: 'plain_text',
          text: '__DESCRIPTION_1__'
        }
      },
      {
        text: {
          text: '__TEXT_2__',
          type: 'plain_text'
        },
        value: '__VALUE_2__',
        description: {
          type: 'plain_text',
          text: '__DESCRIPTION_2__'
        }
      },
      {
        text: {
          text: '__TEXT_3__',
          type: 'plain_text'
        },
        value: '__VALUE_3__',
        description: {
          type: 'plain_text',
          text: '__DESCRIPTION_3__'
        }
      }
    ]
  end

  describe '.initialize' do
    it 'yields self' do
      yielded = nil
      new_instance = described_class.new(**params) do |static_select|
        yielded = static_select
      end

      expect(new_instance).to be(yielded)
    end
  end

  describe '#as_json' do
    subject(:as_json) { instance.as_json }

    let(:expected_json) do
      {
        type: 'multi_static_select',
        placeholder: {
          type: 'plain_text',
          text: placeholder_text
        },
        action_id: action_id
      }
    end

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
          type: 'multi_static_select',
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
          type: 'multi_static_select',
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

      it 'correctly serializes' do
        expect(as_json).to eq(expected_json)
      end
    end

    context 'with options' do
      subject(:as_json) do
        instance.option(value: '__VALUE_1__', text: '__TEXT_1__', description: '__DESCRIPTION_1__')
        instance.option(value: '__VALUE_2__', text: '__TEXT_2__', description: '__DESCRIPTION_2__')
        instance.option(value: '__VALUE_3__', text: '__TEXT_3__', description: '__DESCRIPTION_3__')
        instance.as_json
      end

      it 'correctly serializes' do
        expect(as_json).to eq(
          expected_json.merge(options: expected_options)
        )
      end
    end

    context 'with options and initial option' do
      subject(:as_json) do
        instance.option(value: '__VALUE_1__', text: '__TEXT_1__', description: '__DESCRIPTION_1__')
        instance.option(value: '__VALUE_2__', text: '__TEXT_2__', description: '__DESCRIPTION_2__', initial: true)
        instance.option(value: '__VALUE_3__', text: '__TEXT_3__', description: '__DESCRIPTION_3__')

        instance.as_json
      end

      it 'correctly serializes' do
        expect(as_json).to eq(
          expected_json.merge(
            options: expected_options,
            initial_options: expected_initial_options
          )
        )
      end
    end

    context 'with option_groups' do
      subject(:as_json) do
        instance.option_group(label: '__GROUP__') do |group|
          group.option(value: '__VALUE_1__', text: '__TEXT_1__', description: '__DESCRIPTION_1__')
          group.option(value: '__VALUE_2__', text: '__TEXT_2__', description: '__DESCRIPTION_2__')
          group.option(value: '__VALUE_3__', text: '__TEXT_3__', description: '__DESCRIPTION_3__')
        end
        instance.as_json
      end

      it 'correctly serializes' do
        expect(as_json).to eq(
          expected_json.merge(option_groups: expected_option_groups)
        )
      end
    end

    context 'with option_groups and initial option' do
      subject(:as_json) do
        instance.option_group(label: '__GROUP__') do |group|
          group.option(value: '__VALUE_1__', text: '__TEXT_1__', description: '__DESCRIPTION_1__')
          group.option(value: '__VALUE_2__', text: '__TEXT_2__', description: '__DESCRIPTION_2__', initial: true)
          group.option(value: '__VALUE_3__', text: '__TEXT_3__', description: '__DESCRIPTION_3__')
        end

        instance.as_json
      end

      it 'correctly serializes' do
        expect(as_json).to eq(
          expected_json.merge(
            option_groups: expected_option_groups,
            initial_options: expected_initial_options
          )
        )
      end
    end

    context 'with focus_on_load' do
      let(:params) do
        {
          placeholder: placeholder_text,
          action_id: action_id,
          focus_on_load: true
        }
      end

      it 'correctly serializes' do
        expect(as_json).to eq(expected_json.merge(focus_on_load: true))
      end
    end
  end
end
