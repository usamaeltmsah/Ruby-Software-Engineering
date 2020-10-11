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

    def sub_salaries
        total_salary = 0
        employees.each do |employee|
            if employee.is_a?(Manager)
                total_salary += employee.salary + employee.sub_salaries
            else
                total_salary += employee.salary
            end
        end
        total_salary
    end

    def bonus(multiplier)
       sub_salaries * multiplier
    end
end