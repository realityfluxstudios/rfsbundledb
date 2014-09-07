class Ebook < ActiveRecord::Base
  belongs_to :bundle

  has_many :kinds, :as => :platforms
end
