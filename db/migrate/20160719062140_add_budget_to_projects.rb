class AddBudgetToProjects < ActiveRecord::Migration
  def change

  	#add_column :table_name, :column_name, :column_type
  	add_column :projects, :budget, :integer
  	#add_column :clients, :tin_no, :string
  	
  end
end
