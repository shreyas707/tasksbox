class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :email
      t.string :webstie

      t.timestamps
    end
  end
end
