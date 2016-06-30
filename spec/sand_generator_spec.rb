require 'sand_generator'

RSpec.describe SandGenerator do
  before :each do
    @player = Player.new
  end

  describe "#cost" do
    it "is 50" do
      expect(SandGenerator.new(@player).cost).to eq(50)
    end
  end
end
