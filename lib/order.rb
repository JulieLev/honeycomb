class Order

  attr_reader :deliveries

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
end
