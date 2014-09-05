class Game < ActiveRecord::Base
  belongs_to :bundle

  has_many :gamekeys
  has_many :giftedgamekeys

  default_scope { order('title ASC') }
end
