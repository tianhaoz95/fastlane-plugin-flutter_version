describe Fastlane::Actions::FlutterVersionAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The flutter_version plugin is working!")

      Fastlane::Actions::FlutterVersionAction.run(nil)
    end
  end
end
