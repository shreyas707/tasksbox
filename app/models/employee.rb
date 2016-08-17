class Employee < ActiveRecord::Base

	before_create :generate_employee_code

	belongs_to :company	

	belongs_to :department

	def generate_employee_code
		self.employee_code = "#{Employee.last.nil? ? 1 : Employee.last.id + 1}"
	end

end
