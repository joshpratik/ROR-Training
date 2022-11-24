class Employee
  attr_accessor :employee_id, :name, :address, :basic_salary    #getters and setters for properties
  @@number_of_employees = 0                                     #shared class variable for count of number of employees
  def initialize(employee_id, name, address, basic_salary)      #constructor/initialize method
    @employee_id = employee_id
    @name = name
    @address = address
    @basic_salary = basic_salary
    @@number_of_employees += 1
  end

  def calculate_hra         #function for calculating HRA
    @basic_salary * 0.5
  end

  def calculate_ta          #function for calculating TA
    @basic_salary * 0.1
  end

  def total_salary        #function for calculating total salary
    @basic_salary + calculate_hra + calculate_ta
  end

  def self.total_number_of_employees  #function for returnig total number of employees
    @@number_of_employees
  end
end

#main method for testing of class

employee1 = Employee.new(735,"Pratik","Pune",25000)
puts "Name : #{employee1.name} , Basic Salary : #{employee1.basic_salary} , Total Salary : #{employee1.total_salary}"

employee1 = Employee.new(741,"Harshal","Pune",27000)
puts "Name : #{employee1.name} , Basic Salary : #{employee1.basic_salary} , Total Salary : #{employee1.total_salary}"

puts "Total Number of Employees : #{Employee.total_number_of_employees}"