class Bundle < ActiveRecord::Base

  validates :title, uniqueness: true

  has_many :games
  has_many :androidgames
  has_many :musictracks
  has_many :drm_free_games
  has_many :ebooks

  def unique_ebooks
    self.ebooks.select(:title).distinct
  end

  def unique_drmfree
    self.drm_free_games.select(:title).distinct
  end

  def game_keys_count
    total = 0
    self.games.each do |game|
      total += game.gamekeys.count
    end
    total
  end
end
