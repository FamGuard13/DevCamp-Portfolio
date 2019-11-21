class AddItemsToPortfolioAndQualifications < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolios, :link, :text
    add_column :schools, :link, :text
    add_column :schools, :img, :text
    add_column :jobs, :img, :text
    add_column :jobs, :link, :text
  end
end