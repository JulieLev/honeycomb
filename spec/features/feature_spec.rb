require 'delivery'
require 'order'
require 'material'
require 'broadcaster'

describe 'Feature: discounts give expected values' do
  material_wnp = Material.new("WNP/SWCL001/01")
  material_zdw = Material.new("ZDW/EOWW005/010")

  disney = Broadcaster.new("Disney")
  discovery = Broadcaster.new("Discovery")
  viacom = Broadcaster.new("Viacom")
  horse = Broadcaster.new("Horse and Country")

  standard_delivery_1 = Delivery.new( '100', material_wnp, disney)
  standard_delivery_2 = Delivery.new( '101', material_wnp, discovery)
  standard_delivery_3 = Delivery.new( '102', material_wnp, viacom)
  express_delivery_1 = Delivery.new( '103', material_wnp, horse, "Express")
  express_delivery_2 = Delivery.new( '104', material_zdw, disney, "Express")
  express_delivery_3 = Delivery.new( '105', material_zdw, discovery, "Express")
  express_delivery_4 = Delivery.new( '106', material_zdw, viacom, "Express")

  context 'order has three standard and one express delivery' do
    order = Order.new

    order.add_delivery(standard_delivery_1)
    order.add_delivery(standard_delivery_2)
    order.add_delivery(standard_delivery_3)
    order.add_delivery(express_delivery_1)

    it 'should have an order total of $45' do
      expect(order.final_discounted_cost).to eq 45
    end
  end

  context 'order has three express deliveries' do
    order = Order.new

    order.add_delivery(express_delivery_2)
    order.add_delivery(express_delivery_3)
    order.add_delivery(express_delivery_4)

    it 'should have an order total of $40.50' do
      expect(order.final_discounted_cost).to eq 40.5
    end
  end
end
