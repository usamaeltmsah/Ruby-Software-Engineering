class Room
    def initialize(capacity)
        @capacity = capacity
        @occupants = []
      end
      
      def capacity
        @capacity
      end

      def occupants
        @occupants
      end

      def full?
        if @occupants.length < @capacity
            return false
        end
        return true
    end

    def available_space
        @capacity - @occupants.length
    end
end
