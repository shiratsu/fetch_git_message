require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class FetchGitMessageHelper
      # class methods that you define here become available in your action
      # as `Helper::FetchGitMessageHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the fetch_git_message plugin helper!")
      end
    end
  end
end
