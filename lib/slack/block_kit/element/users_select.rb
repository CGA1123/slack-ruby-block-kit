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

        def to_h
          {
            type: TYPE,
            placeholder: @placeholder.to_h,
            action_id: @action_id,
            initial_user: @initial_user,
            confirm: @confirm&.to_h
          }.compact
        end
      end
    end
  end
end
