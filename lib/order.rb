class Order

  def initialize(deliveries = [])
    @deliveries = deliveries
  end

  def full_cost
    @deliveries.inject(0) { |sum, delivery| sum + delivery.cost }
  end
end
