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
end
