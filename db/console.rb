require_relative '../models/pizza_order'
require_relative '../models/customer'



customer1 = Customer.new({
    'name' => "Ally McGilloway"
    })

customer2 = Customer.new({
    'name' => "John McCollum"
    })

customer1.save
customer2.save

order1 = PizzaOrder.new({
    'customer_id' => customer1.id,
    'topping' => "Womp-rat",
    'quantity' => 4
  })

order2 = PizzaOrder.new({
   'customer_id' => customer2.id,
    'topping' => "Pineapple",
    'quantity' => 1
  })

order1.save
order2.save