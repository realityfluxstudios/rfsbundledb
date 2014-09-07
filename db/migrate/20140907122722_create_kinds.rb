class CreateKinds < ActiveRecord::Migration
  def change
    create_table :kinds do |t|
      t.string :platform
      t.string :dev_url
      t.string :format
      t.string :size
      t.string :http
      t.string :bt
      t.string :md5_hash

      t.belongs_to :drmfree, index: true

      t.timestamps
    end
  end
end