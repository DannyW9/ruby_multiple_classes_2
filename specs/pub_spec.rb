require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../drink.rb')
require_relative('../customer.rb')

class PubTest < MiniTest::Test

def setup
  @drink1 = Drink.new("Guiness", 4)
  @drink2 = Drink.new("Guiness", 4)
  @drink3 = Drink.new("Guiness", 4)
  @drink4 = Drink.new("St Mungo", 4)
  @drink5 = Drink.new("Tequila", 3)

  @drinks = [@drink1, @drink2, @drink3, @drink4, @drink5]
  @pub1 = Pub.new("Howlin Wolf", 1000, @drinks)
  @customer1 = Customer.new("Danny", 100, 26)
  @customer2 = Customer.new("Jodie", 100, 16)
end

def test_can_get_pub_details
  assert_equal("Howlin Wolf", @pub1.name)
  assert_equal(1000, @pub1.till)
  assert_equal(5, @pub1.stock_count)
end

def test_remove_drink_from_stock
  @pub1.remove_from_stock(@drink1)
  assert_equal(4, @pub1.stock_count)
end

def test_check_customer_age
  result = @pub1.check_age(@customer1)
  assert_equal(true, result)
end


def test_can_sell_drink__till_changes
  @pub1.sell_drink(@drink1, @customer1)
  assert_equal(1004, @pub1.till)
  assert_equal(4, @pub1.stock_count)
end

def test_cannot_sell_drink__underage
  @pub1.sell_drink(@drink1, @customer2)
  assert_equal(1000, @pub1.till)
  assert_equal(5, @pub1.stock_count)
end



end
