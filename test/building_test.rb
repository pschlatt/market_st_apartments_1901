require 'minitest/autorun'
require 'minitest/pride'
require './lib/apartment'
require './lib/renter'
require './lib/building'
require 'pry'

class BuildingTest < Minitest::Test
  def setup
    @jessie = Renter.new("Jessie")
    @spencer = Renter.new("Spencer")
    @a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @b2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @building = Building.new
  end

  def test_class_instance
    assert_instance_of Building, @building
  end

  def test_for_units
    assert_equal [], @building.units
  end

  def test_building_can_add_units
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    assert_equal [@a1, @b2], @building.units
  end

  def test_for_average_rent_in_building
    skip
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    assert_equal 1099.5, @building.average_rent
  end

  def test_add_additional_renter
    a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    b2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    building = Building.new
    a1.add_renter(@jessie)
    b2.add_renter(@spencer)
    renters = [@jessie, @spencer]
    building.add_unit(a1)
    building.add_unit(b2)
    units_in_building = [a1, b2]
    assert_equal units_in_building, building.units
    assert_equal renters, [a1.renter, b2.renter]
    assert_equal a1, building.renter_with_highest_rent
  end
end
