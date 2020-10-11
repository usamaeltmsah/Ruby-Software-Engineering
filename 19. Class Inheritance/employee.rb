class Employee
    attr_reader :name, :title, :salary, :boss
    def initialize(name, title, salary, boss=nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end
end