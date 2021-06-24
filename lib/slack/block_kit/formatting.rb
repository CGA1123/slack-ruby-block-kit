# frozen_string_literal: true

module Slack
  module BlockKit
    # Formatting contains some utility functions to help formatting text
    #
    # See: https://api.slack.com/reference/surfaces/formatting
    module Formatting
      extend self # rubocop:disable Style/ModuleFunction

      DATE_FORMAT_TOKENS = [
        # 2014-02-18
        DATE_NUM = '{date_num}',

        # February 18th, 2014
        DATE = '{date}',

        # Feb 18, 2014
        DATE_SHORT = '{date_short}',

        # Tuesday, February 18th, 2014
        DATE_LONG = '{date_long}',

        # February 18th, 2014 but uses "yesterday", "today", or "tomorrow"
        # where
        # appropriate
        DATE_PRETTY = '{date_pretty}',

        # Feb 18, 2014 but uses "yesterday", "today", or "tomorrow" where
        # appropriate
        DATE_SHORT_PRETTY = '{date_short_pretty}',

        # Tuesday, February 18th, 2014 but uses "yesterday", "today", or
        # "tomorrow" where appropriate
        DATE_LONG_PRETTY = '{date_long_pretty}',

        # 6:39 AM or 6:39 PM / 06:39 or 18:39 (depending on user preferences)
        TIME = '{time}',

        # 6:39:45 AM 6:39:42 PM / 06:39:45 or 18:39:42 (depending on user
        # preferences)
        TIME_SECS = '{time_secs}'
      ].freeze

      # Format a URL
      #
      # See: https://api.slack.com/reference/surfaces/formatting#links
      def link(url, link_text: nil)
        "<#{[url, link_text].compact.join('|')}>"
      end

      # Format a mailto link
      #
      # See: https://api.slack.com/reference/surfaces/formatting#links
      def mailto(address, link_text: nil)
        "<mailto:#{[address, link_text].compact.join('|')}>"
      end

      # Link a public channel
      #
      # See: https://api.slack.com/reference/surfaces/formatting#linking-channels
      def channel(identifier)
        "<##{identifier}>"
      end

      # Mention a user
      #
      # See: https://api.slack.com/reference/surfaces/formatting#mentioning-users
      def user(identifier)
        "<@#{identifier}>"
      end

      # Mention a group
      #
      # See: https://api.slack.com/reference/surfaces/formatting#mentioning-groups
      def group(identifier)
        "<!subteam^#{identifier}>"
      end

      # Mention @here (all active users in the current channel)
      #
      # See: https://api.slack.com/reference/surfaces/formatting#special-mentions
      def at_here
        # additional "|here" is for supporting very old mobile clients apparently!
        '<!here|here>'
      end

      # Mention @channel (all users in the current channel)
      #
      # See: https://api.slack.com/reference/surfaces/formatting#special-mentions
      def at_channel
        '<!channel>'
      end

      # Mention @everyone (all users in #general)
      #
      # See: https://api.slack.com/reference/surfaces/formatting#special-mentions
      def at_everyone
        '<!everyone>'
      end

      # Localise a UNIX timestamp to the user's local timezone
      #
      # See: https://api.slack.com/reference/surfaces/formatting#date-formatting
      def date(timestamp, token_string:, link: nil, fallback_text: nil)
        datetime_str = [timestamp, token_string, link].compact.join('^')
        str = [datetime_str, fallback_text].compact.join('|')

        "<!date^#{str}>"
      end

      # Escape special characters (<,>,&) with their HTML entity code so
      # Slack's text parsers knows to interpret them as literals.
      #
      # See: https://api.slack.com/reference/surfaces/formatting#escaping
      def escape(text)
        text
          .gsub('&', '&amp;')
          .gsub('>', '&gt;')
          .gsub('<', '&lt;')
      end
    end
  end
end
