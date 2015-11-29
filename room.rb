class Room
  
  attr_reader :id, :type, :rate
  attr_accessor :status, :occupant

  def initialize(options = {})
    @id = options[:id]
    @type = options[:type]
    @rate = options[:rate]
    @status = "available"
    @occupant = []
  end

  def room_description
    "'#{@id}' room is #{@status}. It is a #{@type} room, and costs £#{rate} per person."  
  end

  def available?
    @status == "available"
  end

  def single?
    @type == "single"
  end

  def double?
    @type == "double"
  end

  def check_in(room)
    room.status = "occupied"
  end

  def check_out(room)
    room.occupant = []
    room.status = "cleaning in progress"
  end

end