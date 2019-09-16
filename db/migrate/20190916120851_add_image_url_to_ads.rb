class AddImageUrlToAds < ActiveRecord::Migration[5.2]
  def change
    add_column :ads, :image_url, :string
  end
end
