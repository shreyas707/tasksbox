class CreateProjectCategories < ActiveRecord::Migration
  def change
    create_table :project_categories do |t|
      t.integer :projecct_id
      t.integer :category_id

      t.timestamps
    end
  end
end
