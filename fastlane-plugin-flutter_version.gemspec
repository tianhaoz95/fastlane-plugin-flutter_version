lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "fastlane/plugin/flutter_version/version"

Gem::Specification.new do |spec|
  spec.name = "fastlane-plugin-flutter_version"
  spec.version = Fastlane::FlutterVersion::VERSION
  spec.required_ruby_version = '>= 2.6'
  spec.author = "tianhaoz95"
  spec.email = "tianhaoz@umich.edu"

  spec.summary = "A plugin to retrieve versioning information for Flutter projects."
  spec.homepage = "https://github.com/tianhaoz95/fastlane-plugin-flutter_version"
  spec.license = "MIT"

  spec.files = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  # Don't add a dependency to fastlane or fastlane_re
  # since this would cause a circular dependency

  spec.add_development_dependency("bundler")
  spec.add_development_dependency("fastlane", ">= 2.142.0")
  spec.add_development_dependency("pry")
  spec.add_development_dependency("rake")
  spec.add_development_dependency("rspec")
  spec.add_development_dependency("rspec_junit_formatter")
  spec.add_development_dependency("rubocop", "0.90.0")
  spec.add_development_dependency("rubocop-require_tools")
  spec.add_development_dependency("simplecov")
end
