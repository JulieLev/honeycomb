require 'order'
describe 'Order' do

  subject(:order) { Order.new }

  context '#cost' do
    it 'has a default full cost of zero' do
      expect(order.full_cost).to eq 0
    end
  end
end
