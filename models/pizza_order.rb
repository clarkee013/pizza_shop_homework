require_relative '../db/SqlRunner'

class PizzaOrder

  attr_accessor  :id, :customer_id, :topping, :quantity

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @customer_id = options['customer_id']
    @topping = options['topping']
    @quantity = options['quantity'].to_i()
    @price = 10
  end

  def total()
    return @quantity * @price
  end

  def save()
    
   sql =  "INSERT INTO pizza_orders (topping, quantity, customer_id) VALUES ('#{@topping}', #{@quantity}, #{@customer_id}) RETURNING *;"
    # Execute SQL query on database
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM pizza_orders;"
    result = SqlRunner.run(sql)
    return result.map {|order| PizzaOrder.new(order)}
  end

  def self.delete_all()
    sql = "DELETE FROM pizza_orders;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM pizza_orders WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE pizza_orders SET (topping, quantity, customer_id) = ('#{@topping}', #{@quantity}, #{customer_id}) WHERE id = #{@id};"

    SqlRunner.run(sql)
  end

  def self.find( id )
      sql = "SELECT * FROM pizza_orders WHERE id=#{id};"
      order = SqlRunner.run( sql )
      result = PizzaOrder.new( order.first )

      return result
    end

  def customer()
    sql = "SELECT * FROM customers WHERE id = #{customer_id};"
    results = SqlRunner.run(sql)
    return Customer.new(results[0])
  end

end