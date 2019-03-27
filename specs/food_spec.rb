require('minitest/autorun')
require('minitest/rg')
require_relative('../food.rb')

class FoodTest < MiniTest::Test

  def setup
    @food1 = Food.new("Burger", 5, 4)
  end

  def test_can_get_food_details
    assert_equal("Burger", @food1.name)
    assert_equal(5, @food1.price)
    assert_equal(4, @food1.rejuvenation_level)
  end

end
