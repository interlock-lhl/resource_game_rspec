require 'coal_generator'

RSpec.describe CoalGenerator do
  before :each do
    @player = Player.new
  end

  describe "#cost" do
    it "is 100" do
      expect(CoalGenerator.new(@player).cost).to eq(100)
    end
  end
end
