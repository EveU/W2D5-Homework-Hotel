require "pry-byebug"
require_relative "hotel"
require_relative "room"
require_relative "guest"

capital = Hotel.new("Hotel Capital")

capital.add_room(Room.new(id: "London", type: "single", rate: 100, status: "available"))
capital.add_room(Room.new(id: "Madrid", type: "single", rate: 100, status: "available"))
capital.add_room(Room.new(id: "Berlin", type: "single", rate: 100, status: "available"))
capital.add_room(Room.new(id: "Paris", type: "double", rate: 95, status: "available"))
capital.add_room(Room.new(id: "Rome", type: "double", rate: 95, status: "available"))

puts "The hotel can take #{capital.capacity} guests."
puts"\n"

puts capital.display_rooms
puts"\n"

capital.add_guest(Guest.new('Anna'))
capital.add_guest(Guest.new('Bill'))
capital.add_guest(Guest.new('Charlie'))
capital.add_guest(Guest.new('Dan'))
capital.add_guest(Guest.new('Emma'))
capital.add_guest(Guest.new('Fred'))
capital.add_guest(Guest.new('George'))
capital.add_guest(Guest.new('Helen'))

######################################

capital.check_in("London", "Helen")
capital.check_in("Rome", "Anna", "Fred")
puts "\n"

puts "There are currently #{capital.current_occupancy} guests staying at the hotel."
puts "\n"

capital.check_out("London")
capital.check_out("Rome")
puts "\n"

puts "Revenue to date: £#{capital.revenue}."

######################################

binding.pry;""