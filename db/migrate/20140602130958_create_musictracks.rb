class CreateMusictracks < ActiveRecord::Migration
  def change
    create_table :musictracks do |t|
      t.string :title
      t.string :title_slug
      t.string :dev
      t.string :dev_slug
      t.string :dev_url
      t.string :mp3dllink
      t.string :mp3type
      t.string :flacdllink
      t.string :flactype
      t.string :format
      t.string :size
      t.string :http
      t.string :bt
      t.string :md5_hash

      t.belongs_to :bundle, index: true

      t.timestamps
    end
  end
end
