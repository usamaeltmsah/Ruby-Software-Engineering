class Passenger
    attr_reader :name

    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(flight_number)
        return @flight_numbers.any? { |fli_num| fli_num.casecmp(flight_number) == 0 }
    end
end