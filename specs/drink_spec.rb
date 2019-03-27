require('minitest/autorun')
require('minitest/rg')
require_relative('../drink.rb')

class DrinkTest < MiniTest::Test

def setup
  @drink1 = Drink.new("Guiness", 4)
end

def test_can_get_drink
  assert_equal("Guiness", @drink1.name)
  assert_equal(4, @drink1.price)
end


end
