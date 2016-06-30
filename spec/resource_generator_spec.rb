require 'resource_generator'

RSpec.describe ResourceGenerator do

  describe "#initialize" do
    it "sets player" do
      player = Player.new
      expect(ResourceGenerator.new(player).owner).to eq(player)
    end

    it "sets last_collected to param" do
      player = Player.new
      expect(ResourceGenerator.new(player,1000).last_collected).to eq(1000)
    end
  end

  describe "#collect" do
    before :each do
      @player = Player.new
      @rg = ResourceGenerator.new(@player, 1000)
    end

    # it "takes epoch timestamp input" do
    #   expect(@rg.collect(1100))
    # end

    it "returns instance of resources generater" do
      expect(@rg.collect(1100)).to be_instance_of(Resource::Base)
    end

    it "returns a resource with a count of 100 after 100 ticks" do
      expect(@rg.collect(1100).count).to eq(100)
      expect(@rg.collect(1100).count).to eq(0)
    end

    it "updates the last_collected value" do
      @rg.collect(1101)
      expect(@rg.last_collected).to eq(1101)
    end

    it "updates the player resources" do
      expect(@player).to receive(:addResource).with(kind_of(Resource::Base)).once
      @rg.collect(1100)
    end
  end
end
