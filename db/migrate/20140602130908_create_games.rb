class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :title_slug
      t.string :drm
      t.string :store_url
      t.string :image_url
      t.string :price
      t.string :cheap_shark_id
      t.string :cheap_shark_url
      t.string :steam_id

      t.belongs_to :bundle, index: true

      t.timestamps
    end
  end
end
