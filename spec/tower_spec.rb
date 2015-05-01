require 'rspec'
require 'tower'

describe Game do
  subject(:towers) { Game.new }

  describe "#move" do
    before(:each) { towers.move(1, 3) }

    it "should move one disc to another empty tower" do
      expect(towers[3]).to eq([1])
      expect(towers[1]).to eq([3, 2])
    end

    it "should not let you move from an empty tower" do
      expect { towers.move(2, 3) }.to raise_error
    end

    it "should not let you move a bigger piece onto a smaller piece" do
      expect { towers.move(1, 3) }.to raise_error
    end
  end

  describe "#game_over?" do
    it "should end the game when it's supposed to" do
      towers.move(1, 3)
      towers.move(1, 2)
      towers.move(3, 2)
      towers.move(1, 3)
      towers.move(2, 1)
      towers.move(2, 3)
      towers.move(1, 3)

      expect(towers.game_over?).to eq(true)
    end

    it "should not end before then" do
      towers.move(1, 3)
      towers.move(1, 2)
      towers.move(3, 2)

      expect(towers.game_over?).to eq(false)
    end
  end
end


describe Tower do
  subject(:tower) { Tower.new([3, 2]) }
  let(:other_tower) { Tower.new([1]) }
  let(:empty_tower) { Tower.new }

  describe "#empty?" do
    context "when empty" do
      it "an empty tower should return that it's empty" do
        expect(empty_tower).to be_empty
      end
    end

    context "when not empty" do
      it "a full tower should not be empty" do
        expect(tower).to_not be_empty
      end
    end
  end
end
