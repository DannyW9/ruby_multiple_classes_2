require('minitest/autorun')
require('minitest/rg')
require_relative('../customer.rb')
require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../food.rb')



class CustomerTest < MiniTest::Test

def setup
  @customer1 = Customer.new("Danny", 100, 26)
  @drink1 = Drink.new("Guiness", 4, 2)
  @pub1 = Pub.new("Howlin Wolf", 1000, [@drink1])
  @food1 = Food.new("Burger", 5, 4)
end

def test_can_get_customer_details
  assert_equal("Danny", @customer1.name)
  assert_equal(100, @customer1.wallet)
  assert_equal(26, @customer1.age)
end

def test_can_adjust_wallet
  @customer1.adjust_wallet(@drink1)
  assert_equal(96, @customer1.wallet)
end

def test_can_change_drunkenness
  @customer1.change_drunkenness(@drink1)
  assert_equal(2, @customer1.drunkenness)
end

def test_can_buy_drink
  @customer1.buy_drink(@pub1, @drink1, @customer1)
  assert_equal(96, @customer1.wallet) #wallet decreases
  assert_equal(1004, @pub1.till) #till increases
end

def test_can_buy_food
  @customer1.buy_food(@pub1, @food1, @customer1)
  assert_equal(95, @customer1.wallet)
  assert_equal(1005, @pub1.till)
  assert_equal(-4, @customer1.drunkenness)
end


end
