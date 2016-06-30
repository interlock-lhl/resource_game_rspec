require 'date'

class ResourceGenerator
  attr_reader :owner
  attr_accessor :last_collected

  COST = 0

  def initialize(player, last_collected=Time.new.to_i)
    @owner = player
    @last_collected = last_collected
  end

  def cost
    self.class::COST
  end

  def self.resources_per_tick
    1
  end

  def collect(ts=Time.new.to_i)
    resource_count = (ts - last_collected) * ResourceGenerator.resources_per_tick
    self.last_collected = ts
    resource = Resource::Base.new(resource_count)
    owner.addResource(resource)
    resource
  end
end
