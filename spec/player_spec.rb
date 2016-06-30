
RSpec.describe Player do

  describe "#initialize" do
    player = Player.new

    it "resources is empty" do
      expect(player.resources).to eq({})
    end

    it "has starting money" do
      expect(player.money).to eq(Player::STARTING_MONEY)
    end
  end

  describe "#build" do
    before do
      @player = Player.new
    end

    it "only accepts ResourceGenerator" do
      # class MockFail
      #   def initialize(what_ever)
      #   end
      # end
      # double("NotAResourceGenerator")
      c = double("NotAResourceGenerator")
      allow(c).to receive(:new)
      expect(@player.build(c)).to eq(false)
    end

    it "returns a ResourceGenerator" do
      rg = @player.build(CoalGenerator)
      expect(rg).to be_instance_of(CoalGenerator)
    end

    it "has owner of ResourceGenerator set to Player" do
      rg = @player.build(CoalGenerator)
      expect(rg.owner).to be(@player)
    end

    it "subtracts cost of ResourceGenerator from money" do
      @player.build(CoalGenerator)
      expect(@player.money).to eq(900)
    end
  end

  describe "#addResource" do

    before :each do
      @player = Player.new
    end

    it "only accepts Resource::Base" do
      expect(@player.addResource(Object.new)).to be(false)
    end

    it "resources has key a Class for resource" do
      @player.addResource(Resource::Coal.new(10))

      expect(@player.resources.has_key?(:Coal)).to be(true)
      expect(@player.resources[:Coal].count).to be(10)
    end

    it "adds resources to existing resource key instance" do
      @player.addResource(Resource::Coal.new(10))
      @player.addResource(Resource::Coal.new(10))

      expect(@player.resources[:Coal].count).to be(20)

    end
  end

  describe "#collect" do

  end


end
