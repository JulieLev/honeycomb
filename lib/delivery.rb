class Delivery

  attr_reader :id, :type, :cost

  STANDARD_DELIVERY_COST = 10
  EXPRESS_DELIVERY_COST = 20

  def initialize(id, material, broadcaster, type = 'Standard')
    @id = id
    @material = material
    @broadcaster = broadcaster
    @type = type
  end

  def cost
    case @type
      when 'Express'
        return EXPRESS_DELIVERY_COST
      when 'Standard'
        return STANDARD_DELIVERY_COST
    end
  end
end
