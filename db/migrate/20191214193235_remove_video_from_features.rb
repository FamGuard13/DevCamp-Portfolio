class RemoveVideoFromFeatures < ActiveRecord::Migration[5.1]
  def change
    remove_column :features, :video
    rename_column :features, :img, :media
  end
end
