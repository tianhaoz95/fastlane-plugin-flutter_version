describe Fastlane::Actions::FlutterVersionAction do
  describe "test" do
    it "prints Flutter version information" do
      expect(Fastlane::UI).to receive(:message).with("The full version is: 1.0.6+15")
      expect(Fastlane::UI).to receive(:message).with("The version name: 1.0.6")
      expect(Fastlane::UI).to receive(:message).with("The version code: 15")
      Fastlane::Actions::FlutterVersionAction.run(pubspec_location: "./example/pubspec.yaml")
    end
  end
end
