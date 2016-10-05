class Order

  EXPRESS_DELIVERY_VOLUME_DISCOUNT = 5 # Discount is a $ amount
  OVER_30_DISCOUNT = 10 # Discount is a percentage %

  attr_reader :deliveries, :cost_after_express_delivery_discount

  def initialize(deliveries = [])
    @deliveries = deliveries
  end

  def full_cost
    @deliveries.inject(0) { |sum, delivery| sum + delivery.cost }
  end

  def add_delivery(delivery)
    @deliveries << delivery
  end

  def standard_delivery_count
    @deliveries.count { |delivery| delivery.type == 'Standard' }
  end

  def express_delivery_count
    @deliveries.count { |delivery| delivery.type == 'Express' }
  end

  def cost_after_express_delivery_discount
    express_delivery_count >= 2 ? full_cost - (EXPRESS_DELIVERY_VOLUME_DISCOUNT * express_delivery_count) : full_cost
  end

  def final_cost
    cost_after_express_delivery_discount >= 30 ? cost_after_express_delivery_discount * (100 - OVER_30_DISCOUNT)/100 : cost_after_express_delivery_discount
  end
end
