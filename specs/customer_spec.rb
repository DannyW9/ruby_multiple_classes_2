require('minitest/autorun')
require('minitest/rg')
require_relative('../customer.rb')
require_relative('../pub.rb')
require_relative('../drink.rb')


class CustomerTest < MiniTest::Test

def setup
  @customer1 = Customer.new("Danny", 100, 26)
  @drink1 = Drink.new("Guiness", 4)
  @pub1 = Pub.new("Howlin Wolf", 1000, [@drink1])
end

def test_can_get_customer_details
  assert_equal("Danny", @customer1.name)
  assert_equal(100, @customer1.wallet)
  assert_equal(26, @customer1.age)
end

def test_can_buy_drink
  @customer1.buy_drink(@pub1, @drink1)
  assert_equal(96, @customer1.wallet) #wallet decreases
  assert_equal(1004, @pub1.till) #till increases
end


end
