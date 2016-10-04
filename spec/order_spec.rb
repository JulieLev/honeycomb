require 'order'
describe 'Order' do

  subject(:order) { Order.new }

  context 'when initialized' do
    it 'has no deliveries' do
      expect(order.deliveries.count).to eq 0
    end

    it 'has a default full cost of zero' do
      expect(order.full_cost).to eq 0
    end
  end

  context 'when deliveries are added' do
    let(:standard_delivery) { double :delivery, cost: 10 }

    before do
      2.times { order.add_delivery(standard_delivery) }
    end

    describe '#add_delivery' do
      it 'adds each delivery to the order' do
        expect(order.deliveries.count).to eq 2
      end
    end

    describe '#cost' do
      it 'has a full cost from the sum of the delivery costs' do
        expect(order.full_cost).to eq 20
      end
    end
  end
end
