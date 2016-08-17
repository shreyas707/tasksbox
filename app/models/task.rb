class Task < ActiveRecord::Base

	belongs_to :project

	validates_presence_of :title#, :due_date, :is_completed
	validate :check_date

	private

	def check_date
		if (self.due_date < self.project.start_date || self.due_date > project.end_date)
			errors.add(:due_date, "is invalid.")
		end
	end

end
