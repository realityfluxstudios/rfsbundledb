class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories, :id => false, :primary_key => 'steam_cat_id' do |t|
      t.primary_key :steam_cat_id
      t.string :description
    end
  end
end
