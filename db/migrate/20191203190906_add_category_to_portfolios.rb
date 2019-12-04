class AddCategoryToPortfolios < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolios, :category, :string
  end
end
