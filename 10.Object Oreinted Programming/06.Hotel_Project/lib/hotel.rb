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
    cap_name = @name.split.map(&:capitalize).join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room)
    return rooms.has_key?(room)
  end

  def check_in(person, room)
    if !room_exists?(room)
        puts 'sorry, room does not exist'
    else
        room_ins = rooms[room]
        if room_ins.add_occupant(person)
            puts 'check in successful'
        else
            puts 'sorry, room is full'
        end
    end
  end

  def has_vacancy?
    rooms.values.each { |room| return true if !room.full?}
    return false
  end

  def list_rooms
    rooms.each { |k, v| puts k + ".*" + v.available_space.to_s }
  end
end
