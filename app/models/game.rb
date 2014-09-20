class Game < ActiveRecord::Base
  belongs_to :bundle

  has_many :gamekeys
  has_many :giftedgamekeys

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :genres

  default_scope { order('title ASC') }
end
