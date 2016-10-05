require 'material'

describe 'Material' do
  subject(:material) { Material.new('WNP/SWCL001/010') }
  context 'identifying advertising materials' do
    it '#clock - has an identifying clock number' do
      expect(material.clock).to eq 'WNP/SWCL001/010'
    end
  end
end
