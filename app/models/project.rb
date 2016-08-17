class Project < ActiveRecord::Base

	validates_presence_of :name, :description, :start_date, :end_date, :client_id, :estimated_budget, :status
	validates_length_of :description, minimum: 10
	validates_numericality_of :client_id

	validate :check_date

	belongs_to :client
	has_many :tasks
	belongs_to :user

	#has_many :join_table
	#has_many :associated_table, through: :join_table

	has_many :project_categories
	has_many :categories, through: :project_categories

	before_destroy :destroy_all_tasks	


	def self.new_projects
		Project.where('status = ?', new)			
	end	


	def completed_tasks
		self.tasks.where('is_completed = ?', true)
	end

	def incompleted_tasks
		self.tasks.where('is_completed = ?', false)
	end


	private
	
	def check_date
		if (!self.end_date.nil? && !self.start_date.nil?) && (self.end_date <= self.start_date)
			errors.add(:end_date, "Should be greater than start date.")
		end
	end

	def destroy_all_tasks
		self.tasks.each do |task|
			task.destroy
		end
	end

end