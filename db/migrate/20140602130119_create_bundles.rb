class CreateBundles < ActiveRecord::Migration
  def change
    create_table :bundles do |t|
      t.string :title
      t.string :title_raw
      t.string :title_slug
      t.string :title_slug_raw
      t.string :site
      t.string :bundle_url

      t.string :humblebundle_trans_id
      t.string :paypal_trans_id
      t.string :indiegala_trans_id
      t.string :bundlestars_trans_id
      t.string :googlewallet_trans_id

      t.timestamps
    end
  end
end
