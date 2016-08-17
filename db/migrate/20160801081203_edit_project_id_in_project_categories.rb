class EditProjectIdInProjectCategories < ActiveRecord::Migration
  def change

  	rename_column :project_categories, :projecct_id, :project_id

  end
end
