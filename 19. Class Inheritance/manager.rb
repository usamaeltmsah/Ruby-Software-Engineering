require_relative 'employee'

class Manager < Employee
    attr_reader :employees
    def initialize(name, title, salary, employees)
        @employees = employees
        super(name, title, salary)
    end

    def sum_salary
        sum = 0
        employees.each { |employee| sum += employee.salary }
        sum
    end

    def bonus(multiplier)
       sum_salary * multiplier
    end
end