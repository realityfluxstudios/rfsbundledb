class Gamekey < ActiveRecord::Base
  belongs_to :game

  validates :key, uniqueness: true
end
