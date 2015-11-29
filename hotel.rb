class Hotel

  attr_reader :name, :rooms, :guest_list, :stays, :revenue, :current_occupancy

  def initialize(name)
    @name = name
    @rooms = {}
    @guest_list = {}
    @capacity = 0
    @stays = 0
    @current_occupancy = 0
    @revenue = 0
  end

  def add_room(room)
    @rooms[room.id] = room
  end

  def display_rooms
    if @rooms.empty?
      "No rooms available."
    else
      rooms_string = @rooms.map { |key, room| room.room_description }
      rooms_string.join("\n")
    end
  end

  def capacity
    @rooms.each do |key, room|
      if room.single?
        @capacity += 1
      elsif room.double?
        @capacity += 2
      end 
    end
    @capacity
  end

  def add_guest(guest)
    @guest_list[guest.name] = guest
  end

  def check_in(room_id, guest_1, guest_2 = nil)
    room = @rooms[room_id]
    return "Invalid room" if !room
    main_guest = @guest_list[guest_1]
    return "Invalid guest name" if !main_guest
    if room != nil && room.available?
      if room.single? && guest_2 == nil
        room.check_in(room)
        room.occupant << main_guest
        main_guest.check_in(room)
        puts "#{guest_1} checked in to '#{room_id}' room."
      elsif room.double? && guest_2 != nil
        second_guest = @guest_list[guest_2]
        return "Invalid guest name" if !second_guest
        room.occupant << main_guest
        room.occupant << second_guest
        room.check_in(room)
        main_guest.check_in(room)
        second_guest.check_in(room)
        puts "#{guest_1} and #{guest_2} checked in to '#{room_id}' room."
      else
        puts "Wrong number of guests."
      end 
    else
      puts "Room unavailable."
    end
  end

  def check_out(room_id)
    room = @rooms[room_id]
    for guest in room.occupant
      guest.check_out(room)
      puts "#{guest.name} has checked out of '#{room_id}' room."
      @revenue += room.rate
    end
    room.check_out(room) 
  end

  def housekeeping
    @rooms.each do |key, room|
      if room.status == "cleaning in progress"
        room.status = "available"
      end
    end
  end

  def current_occupancy
    @rooms.each do |key, room|
      for guest in room.occupant
        @current_occupancy += 1
      end
    end
    @current_occupancy
  end

end
