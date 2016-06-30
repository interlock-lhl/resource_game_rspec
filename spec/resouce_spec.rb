require 'resource'

RSpec.describe Resource do

  describe "Base" do
    it "Initializes with count" do
      b = Resource::Base.new(10)
      expect(b.count).to eq(10)
    end
  end

  describe "Coal" do
    coal = Resource::Coal.new(10)

    it "#burn removes one coal" do
      coal.burn
      expect(coal.count).to eq(9)
    end
  end
end
