class AddSourceToPortfolios < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolios, :source_link, :text
  end
end
