require_relative "room"

class Hotel
  def initialize(name, names_hash)
    @name = name
    @rooms = {}
    names_hash.keys.each do |k| 
        room = Room.new(names_hash[k])
        @rooms[k] = room
    end
  end

  def name
    cap_name = @name.split.map { |n| n.capitalize}
    cap_name.join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room)
    if rooms.keys.include?(room)
        return true
    end
    return false
  end
end
