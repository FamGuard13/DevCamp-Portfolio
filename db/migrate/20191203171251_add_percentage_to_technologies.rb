class AddPercentageToTechnologies < ActiveRecord::Migration[5.1]
  def change
    add_column :technologies, :percent_utilized, :integer
  end
end
