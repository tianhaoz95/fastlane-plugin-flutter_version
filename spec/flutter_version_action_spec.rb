# frozen_string_literal: true

if ENV['CI'] == 'true'
  require 'simplecov'
  SimpleCov.start do
    track_files 'lib/**/*.rb'
  end

  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

# For a list of matchers, see:
# https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers

describe Fastlane::Actions::FlutterVersionAction do
  describe 'run tests' do
    it 'prints Flutter version information' do
      expect(Fastlane::UI)
        .to receive(:message)
        .with('The full version is: 1.0.6+15')
      expect(Fastlane::UI)
        .to receive(:message)
        .with('The version name: 1.0.6')
      expect(Fastlane::UI)
        .to receive(:message)
        .with('The version code: 15')
      Fastlane::Actions::FlutterVersionAction.run(
        pubspec_location: './example/pubspec.yaml'
      )
    end
    it 'output correct version name' do
      expect(
        Fastlane::Actions::FlutterVersionAction.run(
          pubspec_location: './example/pubspec.yaml'
        )['version_name']
      ).to match('1.0.6')
    end
    it 'output correct version code' do
      expect(
        Fastlane::Actions::FlutterVersionAction.run(
          pubspec_location: './example/pubspec.yaml'
        )['version_code']
      ).to match('15')
    end
    it 'has correct description' do
      expect(
        Fastlane::Actions::FlutterVersionAction
          .description
      ).to start_with(
        'A plugin to retrieve versioning ' \
        'information for Flutter projects'
      )
    end
    it 'has correct details' do
      expect(
        Fastlane::Actions::FlutterVersionAction.details
      ).to start_with('The plugin')
    end
    it 'has correct authors' do
      expect(
        Fastlane::Actions::FlutterVersionAction.authors
      ).to contain_exactly('tianhaoz95')
    end
    it 'has correct authors' do
      expect(
        Fastlane::Actions::FlutterVersionAction.return_value
      ).to include(
        ['VERSION_CODE', 'The version code'],
        ['VERSION_NAME', 'The verison name']
      )
    end
    it 'handles malformed version information' do
      malformed_filename = \
        './fixture/malformed_version_information/pubspec.yaml'
      expect do
        Fastlane::Actions::FlutterVersionAction.run(
          pubspec_location: malformed_filename
        )
      end.to raise_error(
        RuntimeError,
        'Verson code indicator (+) not found in pubspec.yml'
      )
    end
    it 'handles missing pubspec' do
      fake_filename = \
        './not/exist/pubspec.yaml'
      expect do
        Fastlane::Actions::FlutterVersionAction.run(
          pubspec_location: fake_filename
        )
      end.to raise_error(
        RuntimeError,
        'Read pubspec.yaml failed'
      )
    end
    it 'list options' do
      expect(
        Fastlane::Actions::FlutterVersionAction.available_options.length
      ).to eq(2)
    end
  end
end
