require('pg')
require_relative('sql_method')

class Ticket

  attr_reader :id, :customer, #:limit

  def initialize(options)
    @id = options['id'].to_i unless options['id'].nil?
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
    #@limit = limit
  end

  def create
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES ('#{@customer_id}', '#{@film_id}') RETURNING *;"
    result = SqlRunner.run(sql)#.first #why?
    @id =  result[0]['id'].to_i
  end

  def delete
    sql = "DELETE FROM tickets WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM tickets;"
    Ticket.get_many
  end

  def frequent_time#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    sql = "SELECT show_time FROM tickets"
    result = Ticket.get_many
    return result.max_by{|element| result.count(element)}
  end
end

  def self.get_many
    result = SqlRunner.run(sql)
    return result.map{|element| Ticket.new(element)}
  end









