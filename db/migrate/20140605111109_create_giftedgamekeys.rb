class CreateGiftedgamekeys < ActiveRecord::Migration
  def change
    create_table :giftedgamekeys do |t|
      t.integer :game_id
      t.string :key
      t.string :gifted_to
      t.string :via
      t.belongs_to :game, index: true

      t.timestamps
    end
  end
end
