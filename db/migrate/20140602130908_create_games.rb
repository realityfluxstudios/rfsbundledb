class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :title_raw
      t.string :title_slug
      t.string :title_slug_raw
      t.string :about
      t.string :description
      t.string :drm
      t.string :dev
      t.string :dev_url
      t.string :dev_support_url
      t.string :store_url
      t.string :app_icon
      t.string :header_image
      t.string :price
      t.string :pc_reqs_min
      t.string :pc_reqs_rec
      t.string :mac_reqs_min
      t.string :mac_reqs_rec
      t.string :linux_reqs_min
      t.string :linux_reqs_rec
      t.string :cheap_shark_id
      t.string :cheap_shark_url
      t.boolean :cheapshark_done
      t.string :steam_id
      t.boolean :steam_done
      t.string :humblebundle_trans_id
      t.string :paypal_trans_id
      t.string :indiegala_trans_id
      t.string :bundlestars_trans_id
      t.string :googlewallet_trans_id

      t.string :categories
      t.string :genres

      t.belongs_to :bundle, index: true

      t.timestamps
    end
  end
end
