require('pg')
require_relative('sql_method')
require_relative('film')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ('#{@name}', '#{@funds}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers;"
    result = SqlRunner.run(sql)
    result.map {|element| Customer.new(element)}
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def update(new_name)
    sql = "UPDATE customers SET name = '#{new_name}' WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql)
  end

  def show_movies
    sql = "SELECT * FROM films WHERE customer_id = #{@id};"
    result = SqlRunner.run(sql)
    array = result.map {|element| Film.new(element)}
  end

  def show_movies_num
    show_movies.count
  end
### WHY DOES THIS FUNCTION UPDATE THE FUNDS ONLY ONCE AND CANNOT BE CALLED MULTIPLE TIMES?
  def buy_ticket(movie)### movie must be a Film.class instance
    price = movie.price
    new_funds = @funds - price
    sql = "UPDATE customers SET funds = #{new_funds} WHERE id = #{@id};"
    result = SqlRunner.run(sql)
    return result.map {|element| Customer.new(element)}
  end

end
