require 'delivery'

describe 'Delivery' do
  let(:material) { double :material }
  let(:broadcaster) { double :broadcaster }

  subject(:standard_delivery) { Delivery.new('100', :material, :broadcaster) }
  subject(:express_delivery) { Delivery.new('100', :material, :broadcaster, 'Express') }

  context '#id' do
    it 'has an identifying id number' do
      expect(standard_delivery.id).to eq '100'
    end
  end

  context '#type' do
    it 'has a default delivery type of Standard' do
      expect(standard_delivery.type).to eq 'Standard'
    end

    it 'can have an alternative delivery type' do
      expect(express_delivery.type).to eq 'Express'
    end
  end

  context '#cost' do
    it 'has a standard cost' do
      expect(standard_delivery.cost).to eq Delivery::STANDARD_DELIVERY_COST
    end

    it 'has an express delivery cost' do
      expect(express_delivery.cost).to eq Delivery::EXPRESS_DELIVERY_COST
    end
  end
end
