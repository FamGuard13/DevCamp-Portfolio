class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :company_name
      t.string :location
      t.date :start_date
      t.date :end_date
      t.text :description
      t.string :job_title
      t.text :company_logo

      t.timestamps
    end
  end
end
