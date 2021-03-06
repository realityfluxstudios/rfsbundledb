class CreateGamekeys < ActiveRecord::Migration
  def change
    create_table :gamekeys do |t|
      t.string :key
      t.string :gift_url
      t.string :gifted_to
      t.string :via
      t.belongs_to :game, index: true

      t.timestamps
    end
  end
end
