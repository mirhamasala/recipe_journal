class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :recipes, :photo_url, :link_to_photo
  end
end
