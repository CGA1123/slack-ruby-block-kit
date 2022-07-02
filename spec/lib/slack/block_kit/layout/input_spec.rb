# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Slack::BlockKit::Layout::Input do
  subject(:input_json) { instance.as_json }

  let(:instance) { described_class.new(**params) }
  let(:optional) { false }
  let(:hint) { 'Your Name' }
  let(:label) { 'Name' }
  let(:block_id) { 'name' }
  let(:emoji) { false }

  let(:params) do
    {
      optional: optional,
      hint: hint,
      label: label,
      block_id: block_id,
      emoji: emoji
    }
  end

  let(:expected_json) do
    {
      type: 'input',
      optional: optional,
      block_id: block_id,
      element: element_json,
      hint: Slack::BlockKit::Composition::PlainText.new(text: hint, emoji: emoji).as_json,
      label: Slack::BlockKit::Composition::PlainText.new(text: label, emoji: emoji).as_json
    }
  end

  describe '#conversation_select' do
    let(:element_json) do
      Slack::BlockKit::Element::ConversationsSelect.new(
        placeholder: '__PLACEHOLDER__',
        action_id: '__ACTION_ID__'
      ).as_json
    end

    it 'correctly serializes' do
      instance.conversation_select(placeholder: '__PLACEHOLDER__', action_id: '__ACTION_ID__')

      expect(input_json).to eq(expected_json)
    end
  end

  describe '#multi_conversations_select' do
    let(:element_json) do
      Slack::BlockKit::Element::MultiConversationsSelect.new(
        placeholder: '__PLACEHOLDER__',
        action_id: '__ACTION_ID__'
      ).as_json
    end

    it 'correctly serializes' do
      instance.multi_conversations_select(placeholder: '__PLACEHOLDER__', action_id: '__ACTION_ID__')

      expect(input_json).to eq(expected_json)
    end
  end

  describe '#channels_select' do
    let(:element_json) do
      Slack::BlockKit::Element::ChannelsSelect.new(
        placeholder: '__PLACEHOLDER__',
        action_id: '__ACTION_ID__'
      ).as_json
    end

    it 'correctly serializes' do
      instance.channels_select(placeholder: '__PLACEHOLDER__', action_id: '__ACTION_ID__')

      expect(input_json).to eq(expected_json)
    end
  end

  describe '#checkboxes' do
    let(:element_json) do
      Slack::BlockKit::Element::Checkboxes.new(
        action_id: '__ACTION_ID__'
      ).as_json
    end

    it 'correctly serializes' do
      instance.checkboxes(action_id: '__ACTION_ID__')

      expect(input_json).to eq(expected_json)
    end
  end

  describe '#datepicker' do
    let(:element_json) do
      Slack::BlockKit::Element::Datepicker.new(
        action_id: '__ACTION_ID__'
      ).as_json
    end

    it 'correctly serializes' do
      instance.datepicker(action_id: '__ACTION_ID__')

      expect(input_json).to eq(expected_json)
    end
  end

  describe '#timepicker' do
    let(:element_json) do
      Slack::BlockKit::Element::Timepicker.new(
        action_id: '__ACTION_ID__'
      ).as_json
    end

    it 'correctly serializes' do
      instance.timepicker(action_id: '__ACTION_ID__')

      expect(input_json).to eq(expected_json)
    end
  end

  describe '#multi_channels_select' do
    let(:element_json) do
      Slack::BlockKit::Element::MultiChannelsSelect.new(
        placeholder: '__PLACEHOLDER__',
        action_id: '__ACTION_ID__'
      ).as_json
    end

    it 'correctly serializes' do
      instance.multi_channels_select(placeholder: '__PLACEHOLDER__', action_id: '__ACTION_ID__')

      expect(input_json).to eq(expected_json)
    end
  end

  describe '#static_select' do
    let(:element_json) do
      Slack::BlockKit::Element::StaticSelect.new(
        placeholder: '__PLACEHOLDER__',
        action_id: '__ACTION_ID__'
      ).as_json
    end

    it 'correctly serializes' do
      instance.static_select(placeholder: '__PLACEHOLDER__', action_id: '__ACTION_ID__')

      expect(input_json).to eq(expected_json)
    end
  end

  describe '#multi_static_select' do
    let(:element_json) do
      Slack::BlockKit::Element::MultiStaticSelect.new(
        placeholder: '__PLACEHOLDER__',
        action_id: '__ACTION_ID__'
      ).as_json
    end

    it 'correctly serializes' do
      instance.multi_static_select(placeholder: '__PLACEHOLDER__', action_id: '__ACTION_ID__')

      expect(input_json).to eq(expected_json)
    end
  end

  describe '#external_select' do
    let(:element_json) do
      Slack::BlockKit::Element::ExternalSelect.new(
        placeholder: '__PLACEHOLDER__',
        action_id: '__ACTION_ID__'
      ).as_json
    end

    it 'correctly serializes' do
      instance.external_select(placeholder: '__PLACEHOLDER__', action_id: '__ACTION_ID__')

      expect(input_json).to eq(expected_json)
    end
  end

  describe '#multi_external_select' do
    let(:element_json) do
      Slack::BlockKit::Element::MultiExternalSelect.new(
        placeholder: '__PLACEHOLDER__',
        action_id: '__ACTION_ID__'
      ).as_json
    end

    it 'correctly serializes' do
      instance.multi_external_select(placeholder: '__PLACEHOLDER__', action_id: '__ACTION_ID__')

      expect(input_json).to eq(expected_json)
    end
  end

  describe '#plain_text_input' do
    let(:element_json) do
      Slack::BlockKit::Element::PlainTextInput.new(
        action_id: '__ACTION_ID__'
      ).as_json
    end

    it 'correctly serializes' do
      instance.plain_text_input(action_id: '__ACTION_ID__')

      expect(input_json).to eq(expected_json)
    end
  end

  describe '#radio_buttons' do
    let(:element_json) do
      Slack::BlockKit::Element::RadioButtons.new(
        action_id: '__ACTION_ID__'
      ).as_json
    end

    it 'correctly serializes' do
      instance.radio_buttons(action_id: '__ACTION_ID__')

      expect(input_json).to eq(expected_json)
    end
  end

  describe '#users_select' do
    let(:element_json) do
      Slack::BlockKit::Element::UsersSelect.new(
        placeholder: '__PLACEHOLDER__',
        action_id: '__ACTION_ID__'
      ).as_json
    end

    it 'correctly serializes' do
      instance.users_select(placeholder: '__PLACEHOLDER__', action_id: '__ACTION_ID__')

      expect(input_json).to eq(expected_json)
    end
  end

  describe '#multi_users_select' do
    let(:element_json) do
      Slack::BlockKit::Element::MultiUsersSelect.new(
        placeholder: '__PLACEHOLDER__',
        action_id: '__ACTION_ID__'
      ).as_json
    end

    it 'correctly serializes' do
      instance.multi_users_select(placeholder: '__PLACEHOLDER__', action_id: '__ACTION_ID__')

      expect(input_json).to eq(expected_json)
    end
  end

  describe '#as_json' do
    let(:element) { Slack::BlockKit::Element::PlainTextInput.new(action_id: 'action') }
    let(:element_json) { element.as_json }
    let(:params) do
      {
        optional: optional,
        element: element,
        hint: hint,
        label: label,
        block_id: block_id,
        emoji: emoji
      }
    end

    it { is_expected.to eq(expected_json) }

    context 'when dispatch_action is set' do
      let(:params) do
        {
          optional: optional,
          element: element,
          hint: hint,
          label: label,
          block_id: block_id,
          emoji: emoji,
          dispatch_action: true
        }
      end

      let(:expected_json) do
        {
          type: 'input',
          optional: optional,
          block_id: block_id,
          element: element_json,
          hint: Slack::BlockKit::Composition::PlainText.new(text: hint, emoji: emoji).as_json,
          label: Slack::BlockKit::Composition::PlainText.new(text: label, emoji: emoji).as_json,
          dispatch_action: true
        }
      end

      it { is_expected.to eq(expected_json) }
    end
  end
end
