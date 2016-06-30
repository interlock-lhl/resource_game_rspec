class Player

  STARTING_MONEY = 1000

  attr_accessor :resources, :money

  def initialize
    @resources = {}
    @money = STARTING_MONEY
  end

  def build(rg)
    return false unless rg.new(self).is_a? ResourceGenerator
    resource = rg.new(self)
    self.money -= resource.class::COST
    resource
  end

  def addResource(r)
    return false unless r.is_a? Resource::Base
    if self.resources[r.name]
      self.resources[r.name].count += r.count
    else
      self.resources[r.name] = r
    end
  end
end
