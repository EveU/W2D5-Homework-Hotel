class Guest

  attr_reader :name, :room, :stays, :hotel_spend

  def initialize(name)
    @name = name
    @room = {}
    @stays = 0
    @hotel_spend = 0
  end

  def check_in(room)
    @room[room.id] = room
  end

  def check_out(room)
    @stays += 1
    @hotel_spend += room.rate
    @room = {}
  end

end