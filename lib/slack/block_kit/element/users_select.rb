# frozen_string_literal: true

module Slack
  module BlockKit
    module Element
      class UsersSelect
        TYPE = 'users_select'

        def initialize(placeholder:, action_id:, initial_user: nil, confirm: nil)
          @placeholder = placeholder
          @action_id = action_id
          @initial_user = initial_user
          @confirm = confirm
        end

        def as_json(*)
          {
            type: TYPE,
            placeholder: @placeholder.as_json,
            action_id: @action_id,
            initial_user: @initial_user,
            confirm: @confirm&.as_json
          }.compact
        end
      end
    end
  end
end
