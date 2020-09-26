# frozen_string_literal: true

require 'fastlane/action'
require 'yaml'
require_relative '../helper/flutter_version_helper'

module Fastlane
  module Actions
    # The top-level plugin interface
    class FlutterVersionAction < Action
      def self.run(params)
        pubspec_location = params[:pubspec_location]
        begin
          pubspec = YAML.load_file(pubspec_location)
        # rubocop:disable Style/RescueStandardError
        rescue
          raise 'Read pubspec.yaml failed'
        end
        # rubocop:enable Style/RescueStandardError
        version = pubspec['version']
        UI.message('The full version is: '.dup.concat(version))
        raise 'Verson code indicator (+) not found in pubspec.yml' unless version.include?('+')

        version_sections = version.split('+')
        version_name = version_sections[0]
        version_code = version_sections[1]
        UI.message('The version name: '.dup.concat(version_name))
        UI.message('The version code: '.dup.concat(version_code))
        {
          'version_code' => version_code,
          'version_name' => version_name
        }
      end

      def self.description
        'A plugin to retrieve versioning information for Flutter projects.'
      end

      def self.authors
        ['tianhaoz95']
      end

      def self.return_value
        [
          ['VERSION_CODE', 'The version code'],
          ['VERSION_NAME', 'The verison name']
        ]
      end

      def self.details
        "The plugin reads and parses pubspec.yml of a Flutter
        project and composes the versioning information into
        structured data to be consumed by various releasing
        automations."
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(
            key: :pubspec_location,
            env_name: 'PUBSPEC_LOCATION',
            description: 'The location of pubspec.yml',
            optional: true,
            type: String,
            default_value: '../pubspec.yaml'
          )
        ]
      end

      # rubocop:disable Naming/PredicateName
      def self.is_supported?(_platform)
        true
      end
      # rubocop:enable Naming/PredicateName
    end
  end
end
