class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres, :id => false, :primary_key => 'steam_genre_id' do |t|
      t.primary_key :steam_genre_id
      t.string :description
    end
  end
end
