require 'fastlane/action'
require_relative '../helper/flutter_version_helper'

module Fastlane
  module Actions
    class FlutterVersionAction < Action
      def self.run(params)
        UI.message("The flutter_version plugin is working!")
      end

      def self.description
        "A plugin to retrieve versioning information for Flutter projects."
      end

      def self.authors
        ["tianhaoz95"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "The plugin reads and parses pubspec.yml of a Flutter project and composes the versioning information into structured data to be consumed by various releasing automations."
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "FLUTTER_VERSION_YOUR_OPTION",
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
