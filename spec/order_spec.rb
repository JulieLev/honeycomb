require 'order'
describe 'Order' do

  subject(:order) { Order.new }
  let(:standard_delivery) { double :delivery, cost: 10, type: 'Standard' }
  let(:express_delivery) { double :delivery, cost: 20, type: 'Express' }

  context 'when initialized' do
    it 'has no deliveries' do
      expect(order.deliveries.count).to eq 0
    end

    it 'has a default full cost of zero' do
      expect(order.full_cost).to eq 0
    end
  end

  context 'when two standard deliveries are added' do
    before do
      2.times { order.add_delivery(standard_delivery) }
    end

    describe '#add_delivery' do
      it 'adds each delivery to the order' do
        expect(order.deliveries.count).to eq 2
      end
    end

    describe '#full_cost' do
      it 'has a full cost from the sum of the delivery costs' do
        expect(order.full_cost).to eq 20
      end
    end

    describe '#standard_delivery_count' do
      it 'knows how many standard deliveries are in the order' do
        expect(order.standard_delivery_count).to eq 2
      end
    end

    describe '#express_delivery_count' do
      it 'knows how many express deliveries are in the order' do
        expect(order.express_delivery_count).to eq 0
      end
    end
  end

  # context 'when order warrants discounts' do
  #   before do
  #     2.times { order.add_delivery(express_delivery) }
  #   end
  # end
end
