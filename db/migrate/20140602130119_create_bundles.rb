class CreateBundles < ActiveRecord::Migration
  def change
    create_table :bundles do |t|
      t.string :title
      t.string :title_slug
      t.string :site

      t.timestamps
    end
  end
end
