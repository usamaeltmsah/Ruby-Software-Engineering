require_relative 'employee'

class Manager < Employee
    def initialize(employees)
        @employees = employees
    end
end