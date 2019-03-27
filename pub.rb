class Pub

attr_reader :name
attr_accessor :till

def initialize(name, till, drinks)
  @name = name
  @till = till
  @drinks = drinks
  @stock = {}
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

def adjust_till(product)
  @till += product.price
end

def sell_drink(drink, customer)
  if check_age(customer) == true && check_drunkenness(customer) == true
      adjust_till(drink)
      remove_from_stock(drink)
    end
  return "Service refused!"
end

def full_stock_count
  for drink in @drinks
    if @stock.include? (drink.name)
      @stock[drink.name] += 1
    else
      @stock[drink.name] = 1
    end
  end
  return @stock
end

def stock_value
  value = 0
  for drink in @drinks
    value += drink.price
  end
  return value
end


end
