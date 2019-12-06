class AddPairedImagesToPortfolios < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolios, :body_img, :text
  end
end
