require('pry')
require('pg')

require_relative('customer')
require_relative('film')
require_relative('tickets')

# Customer.delete_all()
# Film.delete_all()

# customer1 = Customer.new({'name' => 'Blaise', 'funds' => 200})
# customer1.save
# customer2 = Customer.new({'name' => 'Kate', 'funds' => 210})
# customer2.save

# movie1 = Film.new({'title' => 'The Hours', 'price'=> 17})
# movie1.save
# movie2 = Film.new({'title' => 'The Green Mile', 'price' => 18})
# movie2.save
# movie3 = Film.new({'title' => 'Gia', 'price' => 13})
# movie3.save

# ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => movie1.id})
# ticket1.save()
# ticket2 = Ticket.new({'customer_id' => customer1.id, 'film_id' => movie2.id})
# ticket2.save()
# ticket3 = Ticket.new({'customer_id' => customer2.id, 'film_id' => movie3.id})
# ticket3.save()

binding.pry
nil