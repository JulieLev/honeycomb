require 'delivery'
require 'order'
require 'material'
require 'broadcaster'

describe 'feature: discounts give expected values' do
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

  order = Order.new

  order.add_delivery(standard_delivery_1)
  order.add_delivery(standard_delivery_2)
  order.add_delivery(standard_delivery_3)
  order.add_delivery(express_delivery_1)

  it 'should have an order total of $45' do
    expect(order.final_cost).to eq 45
  end
end
