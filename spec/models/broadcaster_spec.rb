require 'broadcaster'

describe 'Broadcaster' do
  subject(:broadcaster) { Broadcaster.new('Viacom') }
  context 'identifying broadcasters' do
    it '#name - has an identifying name' do
      expect(broadcaster.name).to eq 'Viacom'
    end
  end
end
