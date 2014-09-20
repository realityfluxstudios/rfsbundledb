class CreateGiftedgamekeys < ActiveRecord::Migration
  def change
    create_table :giftedgamekeys do |t|
      t.integer :game_id
      t.text :key
      t.text :gifted_to
      t.text :via
      t.belongs_to :game, index: true

      t.timestamps
    end
  end
end
