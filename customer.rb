class Customer

attr_reader :name, :age
attr_accessor :drunkenness, :wallet

def initialize(name, wallet, age)
  @name = name
  @wallet = wallet
  @age = age
  @drunkenness = 0
end

def adjust_wallet(product)
  @wallet -= product.price
end

def change_drunkenness(drink)
  @drunkenness += drink.alcohol_level
end

def buy_drink(pub, drink, customer)
  pub.sell_drink(drink, customer)
  customer.adjust_wallet(drink)
end

def change_drunkenness_food(food)
  @drunkenness -= food.rejuvenation_level
end

def buy_food(pub, food, customer)
  customer.adjust_wallet(food)
  customer.change_drunkenness_food(food)
  pub.adjust_till(food)
end

end
