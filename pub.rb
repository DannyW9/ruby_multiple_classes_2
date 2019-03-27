class Pub

attr_reader :name
attr_accessor :till

def initialize(name, till, drinks)
  @name = name
  @till = till
  @drinks = drinks
end

def stock_count
  @drinks.length()
end

def remove_from_stock(drink)
  @drinks.delete(drink)
end

def check_age(customer)
 return true if customer.age >= 18
 return false if customer.age < 18
end

def check_drunkenness(customer)
  return true if customer.drunkenness < 10
  return false if customer.drunkenness >= 10
end

def adjust_till(drink)
  @till += drink.price
end

def sell_drink(drink, customer)
  if check_age(customer) == true
    if check_drunkenness(customer) == true
      adjust_till(drink)
      remove_from_stock(drink)
    end
  end
end


end
