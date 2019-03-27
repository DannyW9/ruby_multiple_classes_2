class Customer

attr_reader :name, :wallet, :age

def initialize(name, wallet, age)
  @name = name
  @wallet = wallet
  @age = age
end

def adjust_wallet(drink)
  @wallet -= drink.price
end

def buy_drink(pub, drink, customer)
  customer.adjust_wallet(drink)
  pub.sell_drink(drink, customer)
end

end
