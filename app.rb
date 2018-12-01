require 'observer'

class Employee
  include Observable

  attr_reader :name, :title, :salary

  def initialize(name, title, salary)
    @name   = name
    @title  = title
    @salary = salary
    add_observer(Payroll.new)
    add_observer(TaxMan.new)
  end

  def salary=(new_salary)
    @salary = new_salary
    changed
    notify_observers(self)
  end
end

class Payroll
  def update(changed_employee)
    puts changed_employee.salary
  end
end

class TaxMan
  def update(changed_employee)
    puts changed_employee.salary
  end
end


john = Employee.new('John', 'hoge hoge title', 5000)

john.salary = 6000

john.salary = 7000
