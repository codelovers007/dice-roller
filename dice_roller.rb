class Dice
  attr_reader :sides

  def initialize(sides)
    @sides = sides
  end

  def roll
    rand(1..sides)
  end
end

class DiceRoller
  attr_reader :dice, :results, :total

  def initialize(dice)
    @dice = dice
    @results = []
    @total = 0
  end

  def roll_all
    @results = dice.map(&:roll)
    @total = results.sum
    self
  end

  def result_summary
    {
      description: "Rolled #{dice_description}",
      individual_rolls: results,
      total: total
    }
  end

  private

  def dice_description
    dice.map { |die| "#{die.sides}-sided die" }.join(' and ')
  end
end
