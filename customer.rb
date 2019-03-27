class Customer

attr_reader :name, :age
attr_accessor :drunkenness, :wallet

def initialize(name, wallet, age)
  @name = name
  @wallet = wallet
  @age = age
  @drunkenness = 0
end

def adjust_wallet(drink)
  @wallet -= drink.price
end

def change_drunkenness(drink)
  @drunkenness += drink.alcohol_level
end

def buy_drink(pub, drink, customer)
  customer.adjust_wallet(drink)
  pub.sell_drink(drink, customer)
end

end
