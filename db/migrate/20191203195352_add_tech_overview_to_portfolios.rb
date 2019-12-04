class AddTechOverviewToPortfolios < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolios, :tech_overview, :text
  end
end
