class RenameTableAttributes < ActiveRecord::Migration[5.1]
  def change
    rename_column :schools, :school_name, :name
    rename_column :schools, :school_logo, :logo
    rename_column :jobs, :company_name, :name
    rename_column :jobs, :job_title, :title
    rename_column :jobs, :company_logo, :logo
  end
end