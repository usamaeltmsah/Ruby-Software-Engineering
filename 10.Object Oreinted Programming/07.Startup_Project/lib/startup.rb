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

    def size
        @employees.length
    end

    def pay_employee(employee)
        salary = salaries[employee.title]
        if @funding > salary
            employee.pay(salary)
            @funding -= salary
        else
            raise "No enough funding in the startup!"
        end
    end

    def payday
        @employees.each { |employee| pay_employee(employee) }
    end

    def average_salary
        sum = 0
        @employees.each { |emp| sum += salaries[emp.title]}
        sum / @employees.length
    end
end
