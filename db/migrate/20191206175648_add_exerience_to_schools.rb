class AddExerienceToSchools < ActiveRecord::Migration[5.1]
  def change
    add_column :schools, :experience, :text
    add_column :jobs, :experience, :text
  end
end
