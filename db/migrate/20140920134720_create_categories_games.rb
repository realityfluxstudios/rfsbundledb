class CreateCategoriesGames < ActiveRecord::Migration
  def change
    create_table :categories_games, id: false do |t|
      t.belongs_to :category
      t.belongs_to :game
    end
  end
end
