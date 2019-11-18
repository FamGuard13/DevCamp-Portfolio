class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :school_name
      t.string :location
      t.date :start_date
      t.date :end_date
      t.text :description
      t.text :school_logo

      t.timestamps
    end
  end
end
