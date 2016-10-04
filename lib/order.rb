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
end
