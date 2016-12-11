require('pg')
require_relative('sql_method')
require_relative('customer')


class Film

  attr_accessor :title, :price, :customer_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
    @customer_id = options['customer_id'].to_i
  end

  def save 
    sql = "INSERT INTO films (title, price, customer_id) VALUES ('#{@title}', '#{@price}', '#{@customer_id}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
    #price = @price
    #buy_ticket(price)
  end

  def self.all
    sql = "SELECT * FROM films;"
    result = SqlRunner.run(sql)
    result.map {|element| Film.new(element)}
  end

  def delete()
    sql = "DELETE FROM films WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM films;"
    SqlRunner.run(sql)
  end

  def update_price(new_price)
    sql = "UPDATE films SET price = #{new_price} WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def update_title(new_title)
    sql = "UPDATE films SET title = '#{new_title}'WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def show_customers
    sql = "SELECT * FROM customers WHERE id = #{@customer_id};"
    result = SqlRunner.run(sql)
    result.map {|element| Customer.new(element)}
  end

  def show_cust_num
    show_customers.count
  end

end