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
        return @salaries.has_key?(title)
    end

    def >(startup)
        return @funding > startup.funding
    end

    def hire(employee_name, title)
        if valid_title?(title)
            employee = Employee.new(employee_name, title)
            @employees << employee
        else
            raise "Title does not exist!"
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
        @employees.each { |employee| self.pay_employee(employee) }
    end

    def average_salary
        sum = 0
        @employees.each { |emp| sum += salaries[emp.title]}
        sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each { |k, v| @salaries[k] = v if !salaries.keys.include?(k)}
        startup.employees.each { |emp| @employees << emp}
        startup.close
    end
end
