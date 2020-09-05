# frozen_string_literal: true

require 'fastlane_core/ui/ui'

# Fastlane namespace
module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?('UI')

  module Helper
    # Generated helper function for the plugin
    class FlutterVersionHelper
      # class methods that you define here become available in your action
      # as `Helper::FlutterVersionHelper.your_method`
      def self.show_message
        UI.message('Hello from the flutter_version plugin helper!')
      end
    end
  end
end
