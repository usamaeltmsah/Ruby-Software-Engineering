require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        return @salaries.keys.any? { |startup_title| startup_title == title}
    end

    def >(startup)
        return true if self.funding > startup.funding
        false
    end

    def hire(employee_name, title)
        if valid_title?(title)
            employee = Employee.new(employee_name, title)
            @employees << employee
        else
            raise "Title is invalid!"
        end
    end
end
