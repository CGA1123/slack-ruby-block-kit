# frozen_string_literal: true

module Slack
  module BlockKit
    module Layout
      class Section
        # Helper methods for Multi Select to inject to section
        module MultiSelectElements
          def multi_channels_select(placeholder:, action_id:,
                                    initial: nil, emoji: nil, max_selected_items: nil)
            element = Element::MultiChannelsSelect.new(
              placeholder: placeholder,
              action_id: action_id,
              initial: initial,
              emoji: emoji,
              max_selected_items: max_selected_items
            )

            yield(element) if block_given?

            accessorise(element)
          end

          def multi_conversations_select(placeholder:, action_id:,
                                         initial: nil, emoji: nil, max_selected_items: nil)
            element = Element::MultiConversationsSelect.new(
              placeholder: placeholder,
              action_id: action_id,
              initial: initial,
              emoji: emoji,
              max_selected_items: max_selected_items
            )

            yield(element) if block_given?

            accessorise(element)
          end

          def multi_external_select(placeholder:, action_id:,
                                    initial: nil,
                                    min_query_length: nil,
                                    emoji: nil,
                                    max_selected_items: nil)
            element = Element::MultiExternalSelect.new(
              placeholder: placeholder,
              action_id: action_id,
              initial: initial,
              min_query_length: min_query_length,
              emoji: emoji,
              max_selected_items: max_selected_items
            )

            yield(element) if block_given?

            accessorise(element)
          end

          def multi_static_select(placeholder:, action_id:,
                                  emoji: nil, max_selected_items: nil)
            element = Element::MultiStaticSelect.new(
              placeholder: placeholder,
              action_id: action_id,
              emoji: emoji,
              max_selected_items: max_selected_items
            )

            yield(element) if block_given?

            accessorise(element)
          end

          def multi_users_select(placeholder:, action_id:,
                                 initial: nil,
                                 emoji: nil,
                                 max_selected_items: nil)
            element = Element::MultiUsersSelect.new(
              placeholder: placeholder,
              action_id: action_id,
              emoji: emoji,
              initial: initial,
              max_selected_items: max_selected_items
            )

            yield(element) if block_given?

            accessorise(element)
          end
        end
      end
    end
  end
end
