require "fastlane/action"
require "yaml"
require_relative "../helper/flutter_version_helper"

module Fastlane
  module Actions
    class FlutterVersionAction < Action
      def self.run(params)
        pubspec_location = params[:pubspec_location]
        pubspec = YAML.load_file(pubspec_location)
        version = pubspec["version"]
        UI.message("The full version is: ".concat(version))
        if not version.include? "+"
          raise "Verson code indicator (+) not found in pubspec.yml"
        end
        version_sections = version.split("+")
        version_name = version_sections[0]
        version_code = version_sections[1]
        UI.message("The version name: ".concat(version_name))
        UI.message("The version code: ".concat(version_code))
        return {
                 "version_code" => version_code,
                 "version_name" => version_name,
               }
      end

      def self.description
        "A plugin to retrieve versioning information for Flutter projects."
      end

      def self.authors
        ["tianhaoz95"]
      end

      def self.return_value
        [
          ["VERSION_CODE", "The version code"],
        ]
      end

      def self.details
        "The plugin reads and parses pubspec.yml of a Flutter project and composes the versioning information into structured data to be consumed by various releasing automations."
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(
            key: :pubspec_location,
            env_name: "PUBSPEC_LOCATION",
            description: "The location of pubspec.yml",
            optional: true,
            type: String,
            default_value: "../pubspec.yaml",
          ),
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
