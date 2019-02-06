require "pry"
require './lib/apartment'
class Building
  attr_reader :units

  def initialize
    @units = []
    @rents = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    unitsa = @units
    @rents << units[:monthly_rent]

    (@rents.inject(0.0) do |sum, el|
      sum + el
    end)/ @rents.size
  end

  def renter_with_highest_rent
    max_rent = @units.max_by do |rent|

    end
  max_rent
  end

end
