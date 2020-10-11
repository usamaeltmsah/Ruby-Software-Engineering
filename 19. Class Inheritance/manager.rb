require_relative 'employee'

class Manager < Employee
    attr_reader :employees
    def initialize(name, title, salary, boss = nil)
        @employees = []
        super(name, title, salary, boss)
    end

    def add_employee(sub_emp)
        @employees << sub_emp
        sub_emp
    end

    def bonus(multiplier)
       sum_salary * multiplier
    end
end