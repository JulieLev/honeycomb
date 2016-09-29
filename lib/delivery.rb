class Delivery

  attr_reader :id, :type

  def initialize(id, material, broadcaster, type = 'Standard')
    @id = id
    @material = material
    @broadcaster = broadcaster
    @type = type
  end
end
