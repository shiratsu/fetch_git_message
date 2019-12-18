require 'fastlane/action'
require_relative '../helper/fetch_git_message_helper'

module Fastlane
  module Actions
    class FetchGitMessageAction < Action

      $git_message = ''

      def self.run(params)
        UI.message("The fetch_git_message plugin is working!")

        $pub_message = Time.now.strftime('%Y-%m-%d %H:%M:%S')
        value = `git rev-parse HEAD`
        git_tmp_message = `git rev-list --format=%B --max-count=1 #{value}`
        ary_message = git_tmp_message.lines

        # puts $pub_message
        # puts ary_message

        if ary_message.length > 1 then
            $git_message = $pub_message.concat(" "+ary_message[1])
        end
        # puts $git_message
        return $git_message
      end

      def self.description
        "fetch git message"
      end

      def self.authors
        ["hiratsukashu"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
        return $git_message
      end

      def self.details
        # Optional:
        "fetch git last commit message"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "FETCH_GIT_MESSAGE_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
