require_relative 'manager'


ned = Manager.new('Ned', 'Founder', 1_000_000)
darren = Manager.new('Darren', 'TA Manager' , 78_000, ned)
shawna = Manager.new('Shawna', 'TA' , 12_000, darren)
david = Employee.new('David', 'TA', 10_000, darren)


p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
