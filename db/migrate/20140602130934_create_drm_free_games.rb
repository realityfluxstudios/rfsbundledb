class CreateDrmFreeGames < ActiveRecord::Migration
  def change
    create_table :drm_free_games do |t|
      t.string :title
      t.string :title_raw
      t.string :title_slug
      t.string :title_slug_raw
      t.string :dev
      t.string :dev_slug
      t.string :dev_url
      t.string :format
      t.string :size
      t.string :icon
      t.string :http
      t.string :bt
      t.string :platform
      t.string :md5_hash

      t.belongs_to :bundle, index: true

      t.timestamps
    end
  end
end
