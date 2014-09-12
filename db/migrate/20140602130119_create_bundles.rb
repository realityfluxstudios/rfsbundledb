class CreateBundles < ActiveRecord::Migration
  def change
    create_table :bundles do |t|
      t.string :title
      t.string :title_raw
      t.string :title_slug
      t.string :title_slug_raw
      t.string :site
      t.timestamps
    end
  end
end
