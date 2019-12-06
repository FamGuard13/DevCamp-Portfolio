class AddImageAssociationToSchools < ActiveRecord::Migration[5.1]
  def change
    add_column :schools, :description_img, :text
    add_column :schools, :experience_img, :text
    add_column :jobs, :description_img, :text
    add_column :jobs, :experience_img, :text
  end
end
