require 'order'

describe 'Order' do

  subject(:order) { Order.new }
  let(:standard_delivery) { double :delivery, cost: 10, type: 'Standard' }
  let(:express_delivery) { double :delivery, cost: 20, type: "Express" }

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

    describe '#full_cost' do
      it 'has a full cost from the sum of the delivery costs' do
        expect(order.full_cost).to eq 20
      end
    end

    describe '#cost_after_express_delivery_discount' do
      it 'does not apply express delivery discount' do
        expect(order.cost_after_express_delivery_discount).to eq 20
      end
    end

    describe '#final_discounted_cost' do
      it 'does not apply over $30 discount' do
        expect(order.final_discounted_cost).to eq 20
      end
    end
  end

  context 'when order warrants discounts' do
    before do
      2.times { order.add_delivery(express_delivery) }
    end

    it 'applies discount if more than two deliveries are Express' do
      expect(order.cost_after_express_delivery_discount).to eq 40 - (2 * Order::EXPRESS_DELIVERY_VOLUME_DISCOUNT)
    end

    it 'applies discount if order totals more than $30' do
      expect(order.final_discounted_cost).to eq order.cost_after_express_delivery_discount * (100 - Order::OVER_30_DISCOUNT)/100
    end
  end
end
