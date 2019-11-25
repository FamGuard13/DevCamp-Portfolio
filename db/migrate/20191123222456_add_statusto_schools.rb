class AddStatustoSchools < ActiveRecord::Migration[5.1]
  def change
    add_column :schools, :status, :string
  end
end
