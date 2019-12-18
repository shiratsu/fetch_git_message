describe Fastlane::Actions::FetchGitMessageAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The fetch_git_message plugin is working!")

      Fastlane::Actions::FetchGitMessageAction.run(nil)
    end
  end
end
