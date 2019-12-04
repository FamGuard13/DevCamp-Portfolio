class CreateFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :features do |t|
      t.string :title
      t.text :img
      t.text :overview
      t.references :portfolio, foreign_key: true

      t.timestamps
    end
  end
end
