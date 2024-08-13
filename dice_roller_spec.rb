require_relative '../dice_roller'
require 'rspec'

RSpec.describe Dice do
  describe '#roll' do
    it 'returns a value between 1 and the number of sides' do
      dice = Dice.new(6)
      roll = dice.roll
      expect(roll).to be >= 1
      expect(roll).to be <= 6
    end
  end
end

RSpec.describe DiceRoller do
  describe '#roll_all' do
    it 'returns a summary with correct individual rolls and total' do
      dice1 = Dice.new(6)
      dice2 = Dice.new(8)
      roller = DiceRoller.new([dice1, dice2]).roll_all

      summary = roller.result_summary
      expect(summary[:description]).to eq("Rolled 6-sided die and 8-sided die")
      expect(summary[:individual_rolls].length).to eq(2)
      expect(summary[:individual_rolls][0]).to be_between(1, 6).inclusive
      expect(summary[:individual_rolls][1]).to be_between(1, 8).inclusive
      expect(summary[:total]).to eq(summary[:individual_rolls].sum)
    end
  end
end
