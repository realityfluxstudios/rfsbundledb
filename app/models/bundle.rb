class Bundle < ActiveRecord::Base

  validates :title, uniqueness: true

  has_many :games
  has_many :androidgames
  has_many :musictracks
  has_many :drm_free_games
  has_many :ebooks
end
