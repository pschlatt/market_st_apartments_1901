require 'minitest/autorun'
require 'minitest/pride'
require './lib/apartment'
require './lib/renter'

class ApartmentTest < Minitest::Test

  def setup
    @jessie = Renter.new("Jessie")
    @a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
  end

  def test_class_instance
    assert_instance_of Apartment, @a1
  end

  def test_for_number
    assert_equal "A1", @a1.number
  end

  def test_for_monthly_rent
    assert_equal 1200, @a1.monthly_rent
  end

  def test_for_bathroom_number
    assert_equal 1, @a1.bathrooms
  end

  def test_for_bedroom_number
    assert_equal 1, @a1.bedrooms
  end

  def test_for_renters
    assert_nil nil, @a1.renter
  end

  def test_for_adding_a_renter
    @a1.add_renter(@jessie)
    assert_equal @jessie, @a1.renter
  end

end
