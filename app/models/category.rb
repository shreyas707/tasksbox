class Category < ActiveRecord::Base

	belongs_to :user

	#has_many :join_table
	#has_many :associated_table, through: :join_table

	has_many :project_categories
	has_many :projects, through: :project_categories

end
