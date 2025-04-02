module Slack
  module BlockKit
    module Utils
      # Truncate a string to a certain length, adding an optional omission
      # string if the string is truncated. This is generally used to ensure
      # that certain block limits do not exceed their maximum length when
      # autofixing is enabled.
      #
      # See: https://api.rubyonrails.org/classes/String.html#method-i-truncate
      def self.truncate(text, length:, omission: "...", separator: nil)
        return text.dup unless text.length > length

        omission ||= ""
        length_with_room_for_omission = length - omission.length

        stop = text.rindex(separator, length_with_room_for_omission) if separator
        stop ||= length_with_room_for_omission

        "#{text[0, stop]}#{omission}"
      end
    end
  end
end
